#!/usr/bin/perl -w

use strict;
my $n = shift @ARGV or die "$0: <number of lines>";

sub n_lines {
	my @lines;
	my ($n) = @_;
	my $counter = 0;
	while($counter <  $n){
		my $line = <>;
		push @lines, $line;
		$counter++;
	}
	foreach my $output (@lines){
		chomp $output;
		print "$output\n";
	}
}

print n_lines($n);
