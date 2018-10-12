#!/usr/bin/perl -w

use strict;

my @words;
while(my $line = <>){
        foreach my $word ($line =~ /[A-Za-z]+/g){
                push @words, $word;
        }
}
my $word_count= @words;
print "$word_count words\n";1
