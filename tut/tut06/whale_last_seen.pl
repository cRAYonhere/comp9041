#!/usr/bin/perl -w

use strict;
our %last_seen = ();
foreach my $filename (@ARGV){
	open FILE, "<", $filename or die "$0: Shit fked up for $filename.\n";
	while(my $line = <FILE>){
		if($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/){
			my $species = $3;
			my $date = $1;
			#print "$species $date\n";
			$last_seen{$species} = $date;
		}	
	}
	my @species_keys = sort keys %last_seen;
	
	foreach my $species (@species_keys){
		print "$species $last_seen{$species}\n";
	}
}
