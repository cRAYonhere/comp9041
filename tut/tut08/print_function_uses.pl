#!/usr/bin/perl -w

use strict;

my $file = shift @ARGV or die "$0: <filename>";

open FILE, "<", "$file" or die "$0: Cannot open $file";

while (my $line = <FILE>){
	if($line =~ /^[A-Za-z]/){
		#print "$line\n";
		$line =~ /^([A-Za-z][A-Za-z0-9]*) +([A-Za-z_][A-Za-z0-9_]*) *\(([A-Za-z][A-Za-z0-9\* ]*)\)/;
		print "$1, $2, $3\n";
	}
}
