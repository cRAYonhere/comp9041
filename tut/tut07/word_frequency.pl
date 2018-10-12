#!/usr/bin/perl -w

use strict;

our %count_hash= ();
my @lines= <STDIN>;

foreach my $string (@lines){
	my @words = split /\s+/, $string;
	foreach my $word (@words){
		my $hash_key = lc $word;
		$hash_key =~ m/([a-z]+)/;
		$hash_key = $1;
		#print "$1\n";
		if(exists($count_hash{$hash_key})){
			$count_hash{$hash_key} =  $count_hash{$hash_key} + 1; 
		}else{
			 $count_hash{$hash_key} = 1;
		}
	}
}
print "\n";
foreach my $key (sort { $count_hash{$a} <=> $count_hash{$b} } keys %count_hash){
	print "$count_hash{$key}\t$key\n";
}
