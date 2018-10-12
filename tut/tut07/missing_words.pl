#!/usr/bin/perl -w 

use strict;

open fd1, "<", $ARGV[0];
open fd2, "<", $ARGV[1];

our @word_list1= <fd1>;
our @word_list2= <fd2>;

foreach my $word1 (@word_list1){
	chomp $word1;
	my $flag = 0;
	foreach my $word2 (@word_list2){
		chomp $word2;
		#print "Comparing $word1 to $word2\n";
		if($word1 eq $word2){
			#print "Match Found.\n";
			$flag = 1;
		}
	}
	if($flag == 0){
		print "$word1\n";
	}
}
