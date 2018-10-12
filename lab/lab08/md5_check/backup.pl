#!/usr/bin/perl -w

use strict;
use File::Copy "cp";

my $filename= $ARGV[0];
my $count = 0;
my $write = 0;
if (-e $filename){
        while ($write == 0){
                my $dot= ".";
                my $new_filename= $dot.$filename.$dot.$count;
                if (-e $new_filename){
                        #print "Duplicate found.\n";
                        $count++;
                }else{
                        #print "Copy Started.\n";
                        cp($filename, $new_filename) and $write = 1 and print "Backup of '$filename' saved as '$new_filename'\n";
                }
        }
}else{
        print "$0: File Doesn't Exists.$filename";
}

