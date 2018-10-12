#!/usr/bin/perl -w 

use strict;
my %word_count = ();
while(my $line = <>){
        foreach my $word ($line =~ /[A-Za-z]+/g){
                #print("$word\n");
                $word_count{$word}++;
        }
}
print "===Sorted in ASCII order===\n";
foreach my $key(sort keys %word_count){
        print "$word_count{$key}\t $key\n";
}
print "===Lexicographic Order===\n";
foreach my $key(sort {lc $a cmp lc $b} keys %word_count){
        print "$word_count{$key}\t $key\n";
}
