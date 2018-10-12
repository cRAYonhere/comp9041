#!/usr/bin/perl -w

use strict;

my $count_word = $ARGV[0];
my %word_hash = ();
shift;
while(my $line = <>){
	foreach my $word ($line =~ /[A-za-z]+/g){
		$word = lc $word;
		$word_hash{$word}++;		
	}
}

if(!defined $word_hash{$count_word}){
	$word_hash{$count_word}=0;
}
print "$count_word occurred $word_hash{$count_word} times\n";
