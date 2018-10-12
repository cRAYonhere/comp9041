#!/usr/bin/perl -w

use strict;

my %word_count = ();
while (my $line = <>) {
	$line =~ tr/A-Z/a-z/;
	foreach my $word ($line =~ /[a-z]+/g){
		#print("$word\n");
		$word_count{$word}++
	}
}

foreach my $key (sort { $word_count{$a} <=> $word_count{$b} or $a cmp $b} keys %word_count){
	print "$word_count{$key}\t $key\n";
}
