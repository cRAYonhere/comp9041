#!/usr/bin/perl -w

use strict;

my $website = `wget -q -O- $ARGV[0]`;
open FILE, "<" ,\$website or die "$0: what da fuck is this $ARGV[0].\n";
while(my $line = <FILE>){
	my @numbers = split /[^\d\- ]/, $line;
	foreach my $number (@numbers){
		#$number =~ s/\D//g;
		$number =~s/\D//g;
		print "$number.\n" if length $number >= 8 && length $number <=15;
	}
}
