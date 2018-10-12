#!/usr/bin/perl -w

@lines = ();
while($line = <STDIN>) {
    push @lines, $line;
}

$number = @lines;

foreach $l (@lines) {
    $random1 = rand($number);
    $random2 = rand($number);
    
    $temp = $lines[$random1];
    $lines[$random1] = $lines[$random2];
    $lines[$random2] = $temp;
}

foreach $l (@lines) {
    print "$l";
}
