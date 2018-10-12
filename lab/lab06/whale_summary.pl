#!/usr/bin/perl -w

use strict;

our %species_list_members = ();
our %species_list_pods =();
our $total_pods=0;
our $total_members=0;
foreach my $filename (@ARGV){
	open FILE, "<", $filename or die "$0: Unable to open $filename.\n";
	while(my $line = <FILE>) {
		if($line =~ /^(\S+)\s+(\d+)\s+(.+)\s*$/){
			my $species = $3;
			my $count = $2;
			
			my $name = lc $species;
	        	$name =~ s/s$//g;
        		$name =~ s/ +/ /g;
			$name =~ s/ $//g;
			$name =~ s/^ //g;

			$species_list_members{$name}+=$count;
			$species_list_pods{$name}+=1;
		}
	}
}
my @species_keys = sort keys %species_list_pods;
foreach my $key (@species_keys){
	print "$key observations: $species_list_pods{$key} pods, $species_list_members{$key} individuals\n";
}
