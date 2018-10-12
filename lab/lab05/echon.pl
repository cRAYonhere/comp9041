#!/usr/bin/perl -w
$args = $#ARGV + 1;
if ($args == 0 || $args > 2){
	print "Usage: ./echon.pl <number of lines> <string>\n";
} else {
	$_ = $ARGV[0];
	if (m/-[0-9]+/){
        	print  "./echon.pl: argument 1 must be a non-negative integer\n";
	}elsif(m/[^0-9]+/){
		print  "./echon.pl: argument 1 must be a non-negative integer\n";
	}
	else{
		#shift @ARGV;
		$string = $ARGV[1];
		$count=0;

		while($count < $_){
        		print $string,"\n";
        		$count++;
		}
	}
}
