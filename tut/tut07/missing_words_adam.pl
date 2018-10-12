#!/usr/bin/perl -w

use strict;

open FILE1, "<", $ARGV[0] or die "Cannot open $ARGV[0]";
$words{$_} ++ while (<FILE1>);
close FILE1;

open FILE2, "<", $ARGV[1] or die "Cannot open $ARGV[1]";
delete $words{$_} while (<FILE2>);
close FILE2;

print sort keys %words;
