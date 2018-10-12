#!/usr/bin/perl -w

#take input from STDIN
my @array = <>;

#get size of array for the loop
my $array_end = $#array;

#Fisher-Yates
foreach my $i (reverse 1..$array_end) {
	#generate integer pseudo-random number 
        $val = int(rand($array_end+1));
	
	#modulo operation to keep the value in the range of 0 to $#array
        $val = $val % $array_end;
	
        #swap function 
	#print "->swap $i and $val\n";
        $temp = $array[$val];
        $array[$val] = $array[$i];
        $array[$i] = $temp;

}

#print array
foreach (@array){
        print "$_";
}


