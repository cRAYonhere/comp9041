#!/usr/bin/env perl

use warnings;

@lines = ();
while (<>) {
    push @lines, $_;
}

# Fisher-Yates
for ($i = 0; $i <= @lines - 2; $i++) {
    $j = rand(@lines - $i) + $i;
    #print "$j $i\n";
    @lines[$i, $j] = @lines[$j, $i];
}

print @lines;
