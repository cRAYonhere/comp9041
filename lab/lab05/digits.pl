#!/usr/bin/perl -w

local $/;

$content= <STDIN>;

$content =~ s/[0-4]/</g;
$content =~ s/[6-9]/>/g;
$content =~ s/\n$//;

print "$content\n";
