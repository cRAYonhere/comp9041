#!/usr/bin/perl -w

use strict;

@ARGV >= 1 or die "Usage: ./prereq.pl [COURSE CODE]";

my $url_head="http://legacy.handbook.unsw.edu.au/";
my $url_date="/courses/2018/";
my $url_tail=".html";

our @course_types= ("postgraduate", "undergraduate");
our @prerequisite= ();
our %pre_req_hash= ();
foreach my $item (@ARGV){
	if($item =~ /([A-Z]{4}[0-9]{4})/){
		my $course = $1;
		foreach my $course_type (@course_types){
			my $url=$url_head.$course_type.$url_date.$course.$url_tail;
			#print "Opening: $url\n";
                	open FILE, "-|", "wget -q -O- $url" or die "$0: Could not download $url";
			while(my $line = <FILE>) {	
				chomp $line;
				#print "$line\n";
				if($line =~ /Prerequisite[s]*:/){
					#print "$line\n";
					$line =~ s/\<p\>Prerequisite[s]*://g;
					$line =~ /([^\<]*)/;
					$line = $1;
					$line =~ s/[^A-Z0-9 ]//g;
					$line =~ s/ +/ /g;
					#print "$line\n";
					my @prerequisite = split / /, $line;
					foreach my $pre_req (@prerequisite){
						if($pre_req =~ /[A-Z]{4}[0-9]{4}/){
							$pre_req_hash{$pre_req}=$pre_req;
						}
					}
				}
			}
		}
	} else {
		die "$0: Invalid Course Name: $item\n";
	}
	foreach $item (sort keys %pre_req_hash){
		print "$item\n";
	}
	
}
