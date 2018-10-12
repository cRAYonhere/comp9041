#!/usr/bin/perl -w

use strict;
our %hash_store= ();
our %word_count= ();
our %frequency= ();
our %unknown_file = ();
our %similarity = ();
foreach my $file (glob "lyrics/*.txt"){
	open FILE, "<", $file or die "$0: A Fiery death for $file.\n";
	$file =~ /lyrics\/(.+).txt/;
	my $artist= $1;
	#print "====$artist====\n";
	while(my $line = <FILE>){
		$line =~ tr/A-Z/a-z/;
		foreach my $word ($line =~ /[a-z]+/g){
			#print "$word\n";
			$hash_store{$artist}{$word}++;
			$word_count{$artist}++;
		}
	}
}

foreach my $artist (keys %hash_store){
	foreach my $word (keys %{ $hash_store{$artist} }){
		$frequency{$artist}{$word}=log(($hash_store{$artist}{$word}+1)/$word_count{$artist});
	}
}

foreach my $file (@ARGV){
	open FILE, "<", $file or die "$0: Unable to open file.\n";
	while(my $line = <FILE>){
		$line =~ tr/A-Z/a-z/;
		foreach my $word ($line =~ /[a-z]+/g){
			$unknown_file{$file}{$word}++;
		}
	}
}
foreach my $artist (keys %hash_store){
	foreach my $file (keys %unknown_file){
		foreach my $word (keys %{ $unknown_file{$file} }){
			if(!defined($hash_store{$artist}{$word})){
				$frequency{$artist}{$word}= log(1/$word_count{$artist});
			}
			$similarity{$file}{$artist}+=$frequency{$artist}{$word}*$unknown_file{$file}{$word};
		}
	}
}


foreach my $file (sort keys %similarity){
	foreach my $artist_key (sort { $similarity{$file}{$b} <=> $similarity{$file}{$a} }keys %{ $similarity{$file} }){
        	my $artist = $artist_key;
        	$artist =~ s/_/ /g;
        	printf("%s most resembles the work of %s (log-probability=%.1f)\n",$file,$artist,$similarity{$file}{$artist_key});
        	last;
	}
}

