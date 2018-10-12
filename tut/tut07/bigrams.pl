#!/usr/bin/perl -w

use strict;

our @text = <STDIN>;
our %word_hash;
our %word_count;
our @word_array;
my $word_index=0;
foreach my $sentence (@text){
	my @words = split /\s+/, $sentence;
	foreach my $word (@words){
		$word = lc $word;
		$word =~ m/([a-z]+)/;
		$word = $1;
		push @word_array, $word;
		if(!exists($word_hash{$word})){
                        $word_hash{$word}=$word_index;
			$word_index++;
			$word_count{$word}= 1;
		}else{
			$word_count{$word}++;
		}		
	}
}
print("===Word Set===\n");
foreach my $key (sort { $word_hash{$a} <=> $word_hash{$b} } keys %word_hash){
	print("$key\t$word_hash{$key}\n");
}
our %rev_word_hash;
foreach my $key (keys %word_hash){
	$rev_word_hash{$word_hash{$key}}=$key;
}
print("===Word List===\n");
foreach my $word (@word_array){
	print("$word\n");
}
our @bigrams;
my $uniq_words_count= keys %word_hash;
print("Initialize Bigram\n");
foreach my $row (0 .. $uniq_words_count){
        foreach my $col (0 .. $uniq_words_count){
                $bigrams[$row][$col]=0;
        }
}

foreach my $i (0 .. $#word_array-1){
	#print("$i\n");
	if(exists($bigrams[$word_hash{$word_array[$i]}][$word_hash{$word_array[$i+1]}])){
		#print("Exists $i\t$i+1\t$word_array[$i]\t$word_array[$i+1]\t$word_hash{$word_array[$i]}\t$word_hash{$word_array[$i+1]}\n");
		$bigrams[$word_hash{$word_array[$i]}][$word_hash{$word_array[$i+1]}]++;
	}else{
                #print("Creating $i\t$i+1\t$word_array[$i]\t$word_array[$i+1]\t$word_hash{$word_array[$i]}\t$word_hash{$word_array[$i+1]}\n");
		print "Doesn't exist\n";
		$bigrams[$word_hash{$word_array[$i]}][$word_hash{$word_array[$i+1]}]=1;
	}
	#print("phrase count: $bigrams[$word_hash{$word_array[$i]}][$word_hash{$word_array[$i+1]}]\n");
}
my $uniq_words_count= keys %word_hash;
print("Matrix\n");
foreach my $row (0 .. $uniq_words_count){
	foreach my $col (0 .. $uniq_words_count){
		if($bigrams[$row][$col] gt 0){
			
		}
	}
	#print("\n");
}
