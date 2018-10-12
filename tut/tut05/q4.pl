#!/usr/bin/perl -w
use open ':std', ':encoding(UTF-8)';

my $arg_count = $#ARGV + 1;
$_=$ARGV[0];
my $count = 10;

if ( m/\-\d+/ ) {
	#print "Success\n";
	shift @ARGV;
	$_ =~ s/-//g;
	$count = $_;
}
foreach my $filename (@ARGV){
	open(my $fh, '<:encoding(UTF-8)', $filename)
		or die "Could not open file '$filename' $!";
	print "==$filename==","\n";
	$counter=1;
	while (my $line = <$fh>){
		print "$counter $line";
		$counter++;
		if ($counter > $count){
			last;
		}
	}
}

