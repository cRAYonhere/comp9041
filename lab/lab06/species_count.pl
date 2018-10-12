#!/usr/bin/perl -w

use strict;

my $looking_for = $ARGV[0];
shift;
our $total_pods=0;
our $total_members=0;
foreach my $filename (@ARGV){
	open FILE, "<", $filename or die "$0: Unable to open $filename.\n";
	while(my $line = <FILE>) {
		if($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/){
			my $species = $3;
			my $count = $2;
			if($species eq $looking_for){
				$total_members+=$count;
				$total_pods+=1;
			}
		}
	}
} 
print "$looking_for observations: $total_pods pods, $total_members individuals\n";
