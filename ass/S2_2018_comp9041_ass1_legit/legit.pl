#!/usr/bin/perl -w


use strict;
use File::Copy;
use File::Copy "cp";
use File::Compare;
use File::Basename;
no warnings 'experimental::smartmatch';

#directories
my $index_log_dir  = "./.legit/.index_log";
my $commit_log_dir = "./.legit/.commit_log";

#custom format
my $space = "  ";

#generates $error
sub generate_error {
    my $error_code = shift;
    my $arg1 = shift;
    my $arg2 = shift;
    if ( $error_code == 0 ) {
        die "legit.pl: error: invalid filename '$arg1'\n";
    }
    elsif ( $error_code == 1 ) {
        die "legit.pl: error: no .legit directory containing legit repository exists\n";
    }
    elsif ( $error_code == 2 ) {
        die "legit.pl: error: your repository does not have any commits yet\n";
    }
    elsif ( $error_code == 3 ) {
        die "legit.pl: error: '$arg1' not found in index\n";
    }
    elsif ( $error_code == 4 ) {
        die "legit.pl: error: unknown commit '$arg1'\n";
    }
    elsif ( $error_code == 5 ) {
        die "legit.pl: error: '$arg1' not found in commit $arg2\n";
    }
    elsif ( $error_code == 6 ) {
        die "legit.pl: error: can not delete $arg1\n";
    }
    elsif ( $error_code == 7 ) {
        die "legit.pl: error: '$arg1' is not in the legit repository\n";
    }
    elsif ( $error_code == 8 ) {
        die "legit.pl: error: '$arg1' has changes staged in the index\n";
    }
    elsif ( $error_code == 9 ) {
        die "legit.pl: error: '$arg1' in repository is different to working file\n";
    }
    elsif ( $error_code == 10 ) {
        die "legit.pl: error: '$arg1' in index is different to both working file and repository\n";
    }
    elsif ( $error_code == 11 ) {
        die "usage: legit.pl rm [--force] [--cached] <filenames>\n";
    }
    elsif ( $error_code == 12 ) {
        die "usage: legit.pl init\n";
    }
    elsif ( $error_code == 13 ) {
        die "usage: legit.pl commit [-a] -m commit-message\n";
    }
    elsif ( $error_code == 14 ) {
        die "usage: legit.pl log\n";
    }
    elsif ( $error_code == 15 ) {
        die "usage: legit.pl show <commit>:<filename>\n";
    }
    elsif ( $error_code == 16 ) {
        print STDERR "legit.pl: error: unknown command $arg1\n";
        usage_error();
    }
}

#incorrect usage error message
sub usage_error {
    die "Usage: legit.pl <command> [<args>]\n\nThese are the legit commands:\n$space init       Create an empty legit repository\n$space add        Add file contents to the index\n$space commit     Record changes to the repository\n$space log        Show commit log\n$space show       Show file at particular state\n$space rm         Remove files from the current directory and from the index\n$space status     Show the status of files in the current directory, index, and repository\n$space branch     list, create or delete a branch\n$space checkout   Switch branches or restore current directory files\n$space merge      Join two development histories together\n\n";
}

#checks file name is in correct format
#checks file can be accessed/opened/exists
sub check_file_fmt {
    my $refList = shift;
    my @files = @{$refList};
    foreach my $file (@files) {
        if ( $file !~ /^[A-Za-z0-9][A-Za-z0-9_\.\-]*$/ ) {
            generate_error( 0, $file );
        }
    }
}

#checks if legit has read access to the file
sub check_file_read_access {
    my $refList = shift;
    my @files = @{$refList};
    foreach my $file (@files) {
        if ( !-r $file ) {
            die "legit.pl: error: can not open '$file'\n";
        }
    }
}

#checks if .legit directory exists
sub check_init {
    if ( !-e ".legit" ) {
        generate_error(1);
    }
}

#checks for a .add directory to execute add option
#if .add directory doesn't exist, creates .add directory
sub setup_add {
    my $index_loc = "./" . ".legit" . "/.index";
    if ( !-d $index_loc ) {
        mkdir "./" . ".legit" . "/.index"
          or die "legit.pl: error: failed to create .add in .legit $index_loc\n";
    }
    if ( !-f $index_log_dir ) {
        open FILE, ">", $index_log_dir
          or die "legit.pl: error: failed to create .index_log in .legit";
    }
}

#updates files in .index_log according to commits and adds
sub update_index_log {
    my %tracked_files = @_;
    open my $fh_write, ">", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for write\n";
    foreach my $key ( keys %tracked_files ) {
        print $fh_write "$key\t$tracked_files{$key}\n";
    }
    close $fh_write;
}

#copy files from working directory to ./.legit/.index repository
sub copy_files_add {
    my $refList = shift;
    my @files = @{$refList};
    my %remove_duplicate_file = ();

    foreach my $file (@files) {
        chomp $file;
        $remove_duplicate_file{$file} = -1;
    }

    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for read\n";
    while ( my $line = <$fh_read> ) {
        chomp $line;
        my ( $file, $commit_nb ) = split( /\t/, $line, 2 );
        $remove_duplicate_file{$file} = $commit_nb;
    }
    close $fh_read;

    foreach my $file (@files) {
        if ( !cp( $file, "./" . ".legit" . "/.index" . "/" . $file ) ) {
            if ( !remove_from_index_log($file) ) {
                die "legit.pl: error: can not open '$file'\n";
            }
            else {
                delete $remove_duplicate_file{$file};
            }
        }
    }
    update_index_log(%remove_duplicate_file);
}

#copy all files in the index_log into index before commmit
sub commit_a_flag {

    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for read\n";

    my $new_index_log;
    while ( my $line = <$fh_read> ) {
        my ( $file, $commit_nb ) = split( /\t/, $line, 2 );
        my $src  = "./$file";
        my $dest = "./.legit/.index/$file";
        if ( -e $src ) {
            $new_index_log .= "$file\t$commit_nb";
            cp( $src, $dest );
        }
    }
    close $fh_read;
    open my $fh_write, ">", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for read\n";
    print $fh_write $new_index_log;

    close $fh_write;
}

#returns the commit number
sub get_commit_nb {
    if ( !-e $commit_log_dir ) {
        return 0;
    }
    elsif ( !-z $commit_log_dir ) {
        open my $fh_read, "<", $commit_log_dir
          or die "legit.pl: Failed to open .commit_log\n";
        my $firstline = <$fh_read>;
        my @log_entry = split /\t/, $firstline;
        my $new_commit_nb = $log_entry[1] + 1;
        return $new_commit_nb;
    }
    else {
        return 0;
    }
}

#copy all files in index_log to to .index dir for commit
sub cp_index_log_file {
    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for read\n";

    while ( my $line = <$fh_read> ) {
        my ( $file, $commit_nb ) = split( /\t/, $line, 2 );
        if ( $commit_nb >= 0 ) {
            chomp $commit_nb;
            my $src  = "./.legit/.$commit_nb" . "commit/$file";
            my $dest = "./.legit/.index/$file";
            if ( !-e $dest ) {
                my $retVal = cp( $src, $dest );

            }

        }
    }
}

#compares local index_log in commit folder to main index log
sub compare_index_log {
    my $main_index_log = shift;
    my $commit_index_log = shift;
    my %main_index_log_array = ();
    my %commit_index_log_array = ();

    open my $fh_read_main, "<", $main_index_log
      or die "legit.pl: error: can not open the main .index_log\n";
    while (<$fh_read_main>) {
        chomp;
        my ( $file, $commit_nb ) = split( /\t/, $_, 2 );
        $main_index_log_array{$file} = $commit_nb;
    }
    close $fh_read_main;

    open my $fh_read_commit, "<", $commit_index_log
      or die "legit.pl: error: can not open the commit .index_log\n";
    while (<$fh_read_commit>) {
        chomp;
        my ( $file, $commit_nb ) = split( /\t/, $_, 2 );
        $commit_index_log_array{$file} = $commit_nb;
    }
    close $fh_read_commit;

    if ( %main_index_log_array ~~ %commit_index_log_array ) {
        return 0;
    }
    else {
        return 1;
    }
}

#moves file from index to repository
sub commit {
    my $do_commit_flag = -1;
    my @files = glob "./.legit/.index/*";

    my $nb_files = @files;
    my @last_commit_files;

    my $commit_nb = get_commit_nb();

    my $last_commit_nb  = $commit_nb - 1;
    my $last_commit_dir = "./.legit/." . $last_commit_nb . "commit";
    @last_commit_files = glob $last_commit_dir . "/*";
    my $main_index_log   = $index_log_dir;
    my $commit_index_log = $last_commit_dir . "/.index_log";

    if ( $last_commit_nb > -1 ) {

        foreach my $file (@files) {
            my $src      = $file;
            my $last_loc = $last_commit_dir . "/" . basename($file);

            if ( !-f $last_loc or compare( $src, $last_loc ) != 0 ) {
                $do_commit_flag = $commit_nb;
                last;
            }
        }

        #do commit if different number of files staged than last commit
        if ( compare_index_log( $main_index_log, $commit_index_log ) == 1 ) {
            $do_commit_flag = $commit_nb;
        }
    }
    else {
        $do_commit_flag = 0;
    }

    my $commit_dir = "./.legit/." . $commit_nb . "commit";
    if ( $do_commit_flag != -1 ) {
        mkdir $commit_dir
          or die "legit.pl: Failed to create commit directory $commit_dir\n";
        foreach my $file (@files) {
            my $src  = $file;
            my $dest = $commit_dir;
            move( $src, $dest );
        }
        cp( $index_log_dir, $commit_dir );
    }
    else {
        $commit_nb = -1;
    }
    return $commit_nb;
}

#creates a commit log file or commit entry after commit
sub add_commit_log {

    #https://perlmaven.com/how-to-write-to-the-beginning-of-a-file
    my $commit_nb = shift;
    my $add_previous_content = 0;
    my $previous_content;
    my $message = shift;
    if ( !-e $commit_log_dir ) {
        open FILE, '>', $commit_log_dir
          or die "legit.pl: Failed to create .commit_log\n";
    }
    else {
        open my $fh_read, '<', './.legit/.commit_log'
          or die "legit.pl: Can't open .commit_log";
        while ( my $line = <$fh_read> ) {
            $previous_content .= $line;
        }
        close $fh_read;
        $add_previous_content = 1;
    }
    my $file;
    open my $fh_write, '>', './.legit/.commit_log'
      or die "legit.pl: Can't create file handle to .commit_log";
    my $timestamp = localtime(time);
    my $new_line  = "$timestamp\t$commit_nb\t$message\n";
    print $fh_write $new_line;
    if ( $add_previous_content == 1 ) {
        print $fh_write $previous_content;
    }
    close $fh_write;
    print STDOUT "Committed as commit $commit_nb\n";
}

#update index_log with latest commit number
sub update_commit_nb_in_index_log {
    my $commit_nb = shift;
    my $commit_dir = "./.legit/." . $commit_nb . "commit/*";
    my @files = glob $commit_dir;
    my %remove_duplicate_file = ();

    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for read\n";

    while ( my $line = <$fh_read> ) {
        chomp $line;
        my ( $file, $commit_nb ) = split( /\t/, $line, 2 );
        $remove_duplicate_file{$file} = $commit_nb;
    }
    close $fh_read;

    foreach my $file (@files) {
        $remove_duplicate_file{ basename($file) } = $commit_nb;
    }

    open my $fh_write, ">", $index_log_dir
      or die "legit.pl: error: unable to open .index_log file for write\n";
    foreach my $key ( keys %remove_duplicate_file ) {
        print $fh_write "$key\t$remove_duplicate_file{$key}\n";
    }

    close $fh_write;
}

sub check_commit_log_exists {
    if ( !-e $commit_log_dir ) {
        generate_error( 1, $commit_log_dir );
    }
}

sub print_commit_log {
    open my $fh, '<', $commit_log_dir or generate_error(2);
    while ( my $line = <$fh> ) {
        my @vals = split /\t/, $line;
        chomp $vals[2];
        print STDOUT "$vals[1] $vals[2]\n";
    }
}

#shows the file state in index or commit [show <commit_nb>:<filename>]
sub show {
    my $input_commit_nb = shift;
    my $filename = shift;
    my @list = ($filename);
    my @locations;
    $locations[0] = "./.legit/.index/" . $filename;
    check_file_fmt( \@list );

    my $latest_commit_nb = get_commit_nb();
    $latest_commit_nb--;

    if ( $input_commit_nb eq '' ) {
        open my $index_read, '<', $index_log_dir
          or die "legit.pl: error: can not open .index_log file.\n";

        while ( my $index_line = <$index_read> ) {
            chomp $index_line;
            my ( $index_file, $commit_nb ) = split( /\t/, $index_line, 2 );
            if ( $index_file eq $filename ) {
                $locations[1] = "./.legit/." . $commit_nb . "commit/" . $filename;

                foreach my $loc (@locations) {
                    if ( -f $loc ) {
                        open my $fh_read, "<", $loc
                          or die "legit.pl: error: could not open $filename\n";
                        while (<$fh_read>) {
                            print $_;
                        }
                        close $fh_read;
                        close $index_read;
                        return;
                    }
                }
            }
        }
        generate_error( 3, $filename );
    }
    elsif ( $input_commit_nb > $latest_commit_nb ) {
        generate_error( 4, $input_commit_nb );
    }
    elsif ( $input_commit_nb =~ /[0-9]+/ ) {
        my $loc = "./.legit/." . $input_commit_nb . "commit/$filename";
        if ( !-e $loc ) {
            generate_error( 5, $filename, $input_commit_nb );
        }
        else {
            open my $fh_read, "<", $loc
              or die "legit.pl: error: could not open $filename\n";
            while (<$fh_read>) {
                print $_;
            }
            close $fh_read;
        }
    }
    else {
        generate_error( 4, $input_commit_nb );
    }
}

#check if all files in array exist in the index_log
#returns 0 is all files found, else returns first file not found
sub check_file_exists_in_index_log {
    my $refList = shift;
    my @files = @{$refList};
    my %index_file_hash = ();

    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: can not open .index_log file\n";

    while (<$fh_read>) {
        chomp;
        my ( $file, $commit_nb ) = split( /\t/, $_, 2 );
        $index_file_hash{$file} = $commit_nb;
    }
    close $fh_read;
    foreach my $file (@files) {
        if ( !exists( $index_file_hash{$file} ) ) {
            return $file;
        }
    }
    return "";
}

#compares the state of file in last commit to working tree
sub check_head_workingTree {
    my $usr_file = shift;

    my $new_commit_nb  = get_commit_nb();
    my $last_commit_nb = $new_commit_nb - 1;

    my $last_commit_loc = "./.legit/.$last_commit_nb" . "commit/$usr_file";
    my $dest = $usr_file;
    if ( -f $last_commit_loc ) {
        if ( compare( $last_commit_loc, $dest ) == 0 ) {
            return 0;
        }
        else {
            return 1;
        }
    }
    else {
        return 1;
    }
}

#compares the state of file in last commit to staged file
sub check_head_staged {
    my $usr_file = shift;

    my $new_commit_nb  = get_commit_nb();
    my $last_commit_nb = $new_commit_nb - 1;

    my $last_commit_loc = "./.legit/.$last_commit_nb" . "commit/$usr_file";
    my $dest = "./.legit/.index/" . $usr_file;
    if ( -f $last_commit_loc and -f $dest ) {
        if ( compare( $last_commit_loc, $dest ) == 0 ) {

            #no action required
            return 0;
        }
        else {
            #staged file different from HEAD
            return 1;
        }
    }
    elsif ( -f $dest ) {

        #file is staged but not in HEAD
        return 1;
    }
    else {
        #file is not staged
        return 0;
    }
}

#compares the state of file in workingTree to staged file
sub check_workingTree_staged {
    my $usr_file = shift;

    my $new_commit_nb  = get_commit_nb();
    my $last_commit_nb = $new_commit_nb - 1;

    my $staged_loc  = "./.legit/.index/$usr_file";
    my $workingTree = $usr_file;
    if ( -f $staged_loc ) {
        if ( compare( $staged_loc, $workingTree ) == 0 ) {

            #no action required
            return 0;
        }
        else {
            return 1;
        }
    }
    else {
        #file not staged
        return 0;
    }
}

#removes entry from index_log
sub remove_from_index_log {
    my $usr_file = shift;
    my $contents = "";
    my $delete_flag = 0;
    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: can not open .index_log\n";

    while ( my $line = <$fh_read> ) {
        my ( $index_file, $commit_nb ) = split( /\t/, $line, 2 );
        if ( $index_file ne $usr_file ) {
            $contents = $contents . $line;
        }
        else {
            $delete_flag = 1;
        }
    }
    close $fh_read;

    open my $fh_write, ">", $index_log_dir
      or die "legit.pl: error: can not open .index_log\n";

    print $fh_write $contents;

    close $fh_write;

    return $delete_flag;
}

#unlinks file
sub remove_from_workingTree {
    my $file = shift;
    unlink($file) or generate_error( 6, $file );
}

#removes file content from staging area
sub remove_from_stage {
    my $file = shift;
    unlink( "./.legit/.index/" . $file ) or generate_error( 6, $file );
}

#executes legit rm
sub rm {
    check_init();
    check_commit_log_exists();
    my $refList = shift;
    my @args = @{$refList};
    my %flag = ();
    $flag{"--force"}  = 0;
    $flag{"--cached"} = 0;
    my $file_flag = 0;
    my $error     = 0;
    my @files;

    foreach my $arg (@args) {
        if ( $arg eq "--cached" or $arg eq "--force" ) {
            if ( $file_flag == 1
                and ( $flag{"--force"} + $flag{"--cached"} ) > 0 )
            {
                generate_error(11);
            }
            else {
                if ( $file_flag == 1 ) {
                    $error = 1;
                }
                $file_flag = 0;
            }
            $flag{$arg} = 1;
        }
        else {
            if ( $error == 1 ) {
                generate_error(11);
            }
            $file_flag = 1;
            push @files, $arg;
        }
    }

    my $retVal = check_file_exists_in_index_log( \@files );
    if ( $retVal ne "" ) {
        generate_error( 7, $retVal );
    }
    check_file_fmt( \@files );
    check_file_read_access( \@files );

    if ( $flag{"--force"} == 0 and $flag{"--cached"} == 0 ) {
        foreach my $file (@files) {
            my $retVal1 = check_head_workingTree($file);
            my $retVal2 = check_head_staged($file);
            my $retVal3 = check_workingTree_staged($file);

            my $file_in_index = "./.legit/.index/$file";
            if ( $retVal2 == 1 and $retVal3 == 0 )
            {
		          #when the file in workingTree is different from head and workingTree file is staged
                generate_error( 8, $file );
            }
            elsif ( $retVal1 == 1 and !-e $file_in_index ) {
                generate_error( 9, $file );
            }
            elsif ( $retVal2 == 1 and $retVal3 == 1 ) {
                generate_error( 10, $file );
            }
        }

	     #when the head is same as workingTree AND(when the file isn't staged OR the same file as head is staged retVal2 is 0)
        foreach my $file (@files) {
            remove_from_index_log($file);
            remove_from_workingTree($file);
        }
    }
    elsif ( $flag{"--force"} == 0 and $flag{"--cached"} == 1 )
    {
        foreach my $file (@files) {

            #my $retVal1 = check_head_workingTree($file);
            my $retVal2 = check_head_staged($file);
            my $retVal3 = check_workingTree_staged($file);

            my $file_in_index = "./.legit/.index/$file";
            if ( $retVal2 == 1 and $retVal3 == 1 ) {
                generate_error( 10, $file );
            }
        }
        foreach my $file (@files) {
            remove_from_index_log($file);
            if ( -f "./.legit/.index/$file" ) {
                remove_from_stage($file);
            }
        }
    }
    elsif ($flag{"--force"} == 1 and $flag{"--cached"} == 1){
        foreach my $file (@files) {
           remove_from_index_log($file);
           if ( -f "./.legit/.index/$file" ) {
              remove_from_stage($file);
           }
        }
    }
    elsif ( $flag{"--force"} == 1 ) {
        foreach my $file (@files) {
            remove_from_index_log($file);
            remove_from_workingTree($file);
            if ( -f "./.legit/.index/$file" ) {
                remove_from_stage($file);
            }
        }
    }
}

sub index_status {
    open my $fh_read, "<", $index_log_dir
      or die "legit.pl: error: can not open .index_log\n";
    my %file_hash = ();
    while (<$fh_read>) {
        chomp;
        my ( $file, $commit_nb ) = split( /\t/, $_, 2 );

    }
    close $fh_read;

}

my $args = $#ARGV + 1;

if ( $args == 0 ) {
    usage_error();
}
elsif ( $ARGV[0] eq "init" ) {
    if ( $args > 1 ) {
        generate_error(12);
    }
    else {
        if ( -e ".legit" ) {
            die "legit.pl: error: .legit already exists\n";
        }
        else {
            mkdir ".legit"
              or die "legit.pl: error: failed to initialize empty legit repository in .legit\n";
            print STDOUT "Initialized empty legit repository in .legit\n";
            setup_add();
        }
    }
}
elsif ( $ARGV[0] eq "add" ) {
    check_init();
    shift;
    check_file_fmt( \@ARGV );
    copy_files_add( \@ARGV );
}
elsif ( $ARGV[0] eq "commit" ) {
    check_init();
    shift;
    if ( $#ARGV < 1 or $#ARGV > 2 ) {
        generate_error(13);
    }
    my $flag1 = shift;
    if ( $flag1 eq "-a" and $#ARGV == 1 ) {
        my $flag2 = shift;
        if ( $flag2 eq "-m" ) {
            my $message = shift;
            if ( $message =~ /^\s*$/ ) {
                generate_error(13);
            }
            my $update_status = commit_a_flag();

            my $commit_nb = commit();
            if ( $commit_nb != -1 ) {
                add_commit_log( $commit_nb, $message );
                update_commit_nb_in_index_log($commit_nb);
            }
            else {
                print STDOUT "nothing to commit\n";
                exit(0);
            }
        }
        else {
            generate_error(13);
        }
    }
    elsif ( $flag1 eq "-m" and $#ARGV == 0 ) {
        my $message = shift;
        if ( $message =~ /^\s*$/ ) {
            generate_error(13);
        }
        cp_index_log_file();
        my $commit_nb = commit();
        if ( $commit_nb != -1 ) {
            add_commit_log( $commit_nb, $message );
            update_commit_nb_in_index_log($commit_nb);
        }
        else {
            print STDOUT "nothing to commit\n";
            exit(0);
        }
    }
    else {
        generate_error(13);
    }
}
elsif ( $ARGV[0] eq "log" ) {
    check_init();
    shift;
    if ( $#ARGV > -1 ) {
        generate_error(14);
    }
    else {
        print_commit_log();
    }
}
elsif ( $ARGV[0] eq "show" ) {
    check_init();
    check_commit_log_exists();
    shift;
    if ( $#ARGV != 0 ) {
        generate_error(15);
    }

    my $arg2 = shift;

    my ( $commit_nb, $filename ) = split( /:/, $arg2, 2 );

    if ( $commit_nb !~ /[0-9]+/ and $commit_nb ne '' ) {
        generate_error( 4, $commit_nb );
    }
    show( $commit_nb, $filename );
}
elsif ( $ARGV[0] eq "rm" ) {
    shift;
    rm( \@ARGV );
}
elsif ( $ARGV[0] eq "status" ) {
    index_status();
}
else {
    generate_error( 16, $ARGV[0] );
}
