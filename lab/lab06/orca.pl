#!/usr/bin/perl -w

use strict;

foreach my $filename (@ARGV) {
	our $total_count=0;
	our $looking_for="Orca";
	open FILE, "<", $filename or die "$0: Could Not Open $filename.\n";
	while(my $line = <FILE>) {
		if($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/) {
			#print "$1 $2 $3\n";
			my $count=$2;
			my $species=$3;
			if($looking_for eq $species){
				$total_count=$total_count+$count;
			}
		}else {
			die "Parsing Failed:\n$line\n";
		}
	}
	my $s="s";
	print "$total_count $looking_for$s reported in $filename\n";
}
