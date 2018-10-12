#!/usr/bin/perl -w
use open ':std', ':encoding(UTF-8)';

$flag_check = $ARGV[0];
$rev_flag = 0;
$flag = 0;

if ($flag_check eq "-v"){
	shift @ARGV;
	$rev_flag = 1;
}
$re = $ARGV[0];
shift @ARGV;

foreach $file (@ARGV){
	$flag=1;
	open($fh, '<:encoding(UTF-8)', $file)
		or die "Could not open file '$file' $!";
	print "===$file===\n";
	while($line = <$fh>){
		if ($line =~ /$re/){
			print $line;
		}elsif ($rev_flag == 1){
			print $line;
		}
	}
}
 
if ($flag == 0) {
	#print "Success";
	while($line = <> ){
		if($line =~ /$re/){
			print $line;
		}elsif ($rev_flag == 1){
			print $line;
		}
	} 
}
