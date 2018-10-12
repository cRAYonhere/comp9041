#!/usr/bin/perl -w

use strict;

my $user_word = $ARGV[0];
my %word_count = ();
foreach my $file (glob "lyrics/*.txt"){
        open FILE1, "<", $file;
        $file =~ /lyrics\/(.+)\.txt/;
        #print "$1\n";
        my $artist = $1;
        #print "$file\n";
        while(my $line = <FILE1>){
                $line =~ tr/A-Z/a-z/;
                $line =~ s/[^a-z0-9]/ /g;
                #print "$line\n";
                foreach my $word($line =~ /[a-z]+/g){
                        if($word eq $user_word){
                                $word_count{$artist}{0}++;
                        }
                        $word_count{$artist}{1}++;
                }
        }
}
my %frequency=();
foreach my $artist (keys %word_count){
        if(defined $word_count{$artist}{0} && defined $word_count{$artist}{1}){
                $frequency{$artist} = $word_count{$artist}{0}/$word_count{$artist}{1};
        }else{
                $word_count{$artist}{0}=0;
                $frequency{$artist}=0;
        }
}
foreach my $key (sort keys %frequency){
        my $artist = $key;
        $artist =~ s/_/ /g;
        if($word_count{$key}{1} > 0){
            printf("%4d/%6d = %.9f %s\n",$word_count{$key}{0},$word_count{$key}{1},$frequency{$key},$artist);
        }
}





