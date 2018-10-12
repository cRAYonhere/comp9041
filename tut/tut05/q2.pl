#!/usr/bin/perl -w

local $/;

$line = <STDIN>;
$line =~ s/[aeiou]//gi;
print "$line\n";
