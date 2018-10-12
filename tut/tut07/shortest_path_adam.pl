#!/usr/bin/perl -w

use strict;

my $from = $ARGV[0];
my $to = $ARGV[1];

my %distances = ();
my %shortest_journey = ();
my %route = ();

while ($line = <>){
	$line =~ /(\S+)\s+(\S+)\s+(\d+)/;
	$distances{$1}{$2} = $3;
	$distances{$2}{$1} = $3;
}

$shortest_journey{$from} = 0;
$route{$start} = "";

@unprocessed_towns = keys %distance;
my $current_town = $start;

while($current_town && $current_town ne $to) {
	@unprocessed_towns = grep {$_ ne $current_town} @unprocessed_towns;

	foreach $town (@unprocessed_towns) {
		if (defined $distance{$current_town}{$town}){
			my $d = $shortest_journey{$current_town} + $distance{$current_town}{$town};
			if (!defined 
		}
	}
}
