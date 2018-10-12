#!/usr/bin/perl -w

my $arg_count = $#ARGV + 1;
$_=$ARGV[0];
shift @ARGV;
if( $arg_count == 2 ) {
	if ( m/-[0-9]+/ ) {
		$_ =~ s/-//g;
		my $counter=$_;
		while(<>){
			print; 
			$counter--;
			if ($counter == 0){
				last;
			}
		}
	} else {
		die;
	}
} else {
	$counter = 10;
	while(<>){
		print;
		$counter--;
		if( $counter == 0 ){
			last;
		}
	}
}
