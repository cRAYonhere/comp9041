#!/usr/bin/perl -w

use strict;
use File::Copy "cp";
use File::Basename;

my $load="load";
my $save="save";
my $mkdir=0;
my $count=0;
my $operation;
my $usr_backup_nb;
my $sys_backup_nb;
my $dot=".";
my $snapshot="snapshot";
our $backup_dir;
#https://www.perlmonks.org/index.pl?node=Sorting%20Files%20with%20Numbers
sub my_sort{
	my ($a_word, $a_num) = $a =~ /^.(\w+).(\d+)$/;
	my ($b_word, $b_num) = $b =~ /^.(\w+).(\d+)$/;

	return $a_word cmp $b_word || $a_num <=> $b_num;
}
my @files = grep /^[^.]/, glob(".* *");
my @snapshot = grep /^\.snapshot\.[0-9]+/, glob(".* *");
my $nb_snapshot=$#snapshot+1;
my @sorted_snapshot;
my $nb_file=$#files+1;
foreach my $file (sort my_sort @snapshot){
	#print "$file\n";
	push @sorted_snapshot, $file
}
sub save{
	#BUG
	#my $nb_backup_file= $nb_file - 1;
	#print "$nb_file $nb_backup_file\n";
	#if($nb_backup_file <= 0){
	#	die "$0: Empty Directory.\n";
	#}
	if($#sorted_snapshot > -1){
		$sorted_snapshot[$#sorted_snapshot] =~ /^.(\w+).(\d+)$/;
		my $last_backup_nb=$2;
		$sys_backup_nb= $last_backup_nb + 1;
	}else{
		$sys_backup_nb=0;	
	}
	my $dir=$dot.$snapshot.$dot.$sys_backup_nb;
	mkdir $dir and $mkdir=1 and $backup_dir=$dir or die "$0: Failed to create backup directory.\n";
        foreach my $file (glob ".* *"){
                if ($file =~ /^[^.]/ and $file ne "snapshot.pl"){
                        my $backslash="/";
                        my $backup=$backup_dir.$backslash.$file;
                        cp($file, $backup) or die "$0: Failed to copy.\n";
			
                }
        }
	print "Creating snapshot $sys_backup_nb\n";
	return 0;
}
sub load{
	#print "$sys_backup_nb, $usr_backup_nb";
	if($sys_backup_nb == $usr_backup_nb){
		die "$0: Files Cannot be restored from pre-emptive backup."
	}
	my $restore_dir="";
	foreach my $file (@sorted_snapshot){
		$file =~ m/^.(\w+).(\d+)$/;
		if ($usr_backup_nb == $2){
			$restore_dir = $file;
			foreach my $file (glob "$restore_dir/*"){
				my $base=basename($file);
				#print "$file, $base\n";
				cp($file,$base) or die "$0: Failed to copy.\n";
			}	
			last;
		}
	}
	if($restore_dir eq ""){
		die "$0: Failed to restore.";
	}else{
		print "Restoring snapshot $usr_backup_nb\n";
	}
	return 0;
}
my $args=@ARGV;
my $arg1;
my $arg2;
if ($args > 2){
	die "1: Usage: ./snapshot.pl <load/save> <numeric Value>\n";
}elsif($args == 2){
	$arg1=$ARGV[0];
	$arg2=$ARGV[1];
	if($arg1 eq $load and $arg2 =~ m/^[0-9]+/){
		$operation=$load;
		$usr_backup_nb=$arg2;
		save(); 
		load();
	}else{
		 die "2: Usage: ./snapshot.pl load <numeric value>\n";
	}
}elsif($args == 1){
	$arg1=$ARGV[0];
	if($arg1 eq $save){
		$operation=$save;
		save() ;#or die "$0: Failed to Backup.";
	}else{
		die "3: Usage: ./snapshot.pl <save> \n";
	}
}else{
	die "4: Usage: ./snapshot.pl <load/save> <numeric value>\n";
}
