#!/usr/bin/perl -w
use open ':std', ':encoding(UTF-8)';

my $arg_count = $#ARGV + 1;
$arg_flag = 0;
if ($arg_count > 0){
    $_=$ARGV[0];
    $arg_flag = 1;
}
my $count = 10;
my @array;
my $counter = 0;
my $line;

if ($arg_flag && m/\-\d+/ ) {
        #print "Success\n";
        shift @ARGV;
        $_ =~ s/-//g;
        $count = $_;
}
$args = $#ARGV + 1;

if($args <= 0){
        @array = <STDIN>;
        $counter = $#array;
        $start = $counter - $count + 1;
        if($start < 0){
                $start=0;
        }
        #print "$start to $counter\n";
        #print "\n";
        for my $i ($start .. $counter){
                $line = $array[$i];
                chomp $line;
                               print $line,"\n";
        }
} else {

        foreach my $filename (@ARGV){
                open(my $fh, '<:encoding(UTF-8)', $filename)
                        or die "$0: can't open $filename $!\n";
                if ($#ARGV > 0){
                        print "==> $filename <==","\n";
                }
                $counter = 0;
                @array=();
                while ($line = <$fh>){
                        #print "$counter $line";
                        chomp $line;
                        push @array, $line;
                        #print $line,"\n";
                        $counter++;
                }
                #print join(" ",@array);
                $counter--;
                $start=$counter - $count + 1;
                if ($start < 0){
                        $start=0;
                }
                for my $i ($start .. $counter){
                        print $array[$i],"\n";
                }
        }
}
