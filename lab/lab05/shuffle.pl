#!/usr/bin/perl -w

my @array = <>;
my $array_end = $#array;

#Fisher-Yates
foreach my $i (reverse 1..$array_end) {
        $val = int(rand($array_end+1));
        $val= $val % $array_end;
        #print "->swap $i and $val\n";          
        $temp=$array[$val];
        $array[$val]=$array[$i];
        $array[$i]=$temp;

}
        foreach (@array){
                print "$_";
        }


