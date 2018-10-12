#!/usr/bin/perl -w

use strict;

foreach my $filename (@ARGV){
        my $curr_species="";
        my $curr_date="";
        my $curr_count=0;

	open FILE, "<", $filename or die "$0: Cannot open $filename\n";
	while(my $line = <FILE>){
		if($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/){
			my $species = $3;
			my $date = $1;
			my $count = $2;
		
			if($curr_species eq $species && $curr_date eq $date){
				$curr_count = $curr_count + $count;
			}else{
				if ($curr_species ne ""){
					print "$curr_date $curr_count $curr_species\n";
				}
				$curr_species = $species;
        	        	$curr_date = $date;
				$curr_count = $count;
			}
		}
	}
	print "$curr_date $curr_count $curr_species\n";
}

