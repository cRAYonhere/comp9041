#!/usr/bin/perl -w

use strict;


my %colours = ("John" => "blue", "Anne" => "red", "Andrew" => "green");

my $count = printHash(%colours);
print "Items printed: $count\n";

sub printHash{
	my (%user_hash) = @_;
	#my $counter=0;
	foreach my $key (sort keys %user_hash){
		print "[$key] => $user_hash{$key}\n";
		#$counter++;
	}
	#return $counter;
	return keys %user_hash;
}
