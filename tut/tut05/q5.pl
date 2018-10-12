#!/usr/bin/perl -w
use open ':std', ':encoding(UTF-8)';

$re=$ARGV[0];
shift @ARGV;
my $flag=0;
foreach $file (@ARGV){
	my $flag=1;
	open(my $fh, '<:encoding(UTF-8)', $file)
		or die "Could not open file '$file' $!";
	print "===$file===\n";
	while(my $line = <$fh>){
		if ($line =~ /$re/){
			print $line;
		}
	}
} 
if ($flag == 0) {
	#print "Success";
	while($line = <>){
		if($line =~ /$re/){
			print $line;
		}
	} 
}
