#!/usr/bin/perl -w

use strict;

my $filename= $ARGV[0];

open(my $fh, "<", $filename) or die "$0: Failed to Open $filename";

my @lines = <$fh>;

$lines[0] =~ s/#!\/bin\/bash/#!\/usr\/bin\/perl -w/;

#print "$lines[0]";
foreach my $line (@lines){
   if ($line =~ /^#.*/){
      print "$line";
      next;
   }
   if ($line =~ /(\s*)([a-z]+)=(\$*[a-z0-9]+)/){
      #print "$1\n";
      my $new_word = $1."\$".$2." = ".$3.";";
      $line =~ s/.+/$new_word/;
      print "$line";
      next;
   }
   if ($line =~ /.+\s\(\((.+)\)\)/){
      #print "->>>>$1\n";
      my $condn = $1;
      my $new1;
      my $new2;
      my $cond;
      my @items = split /\s/,$condn;
      my $new_str="(";
      foreach my $item (@items){
         if ( $item =~ /[a-z]+/){
            $item = "\$".$item;
         }
         $new_str .= $item." ";
      }
      #print "$new1 $cond $new2\n";
      $new_str .= ")  {";
      #print "$new_string\n";
      $line =~  /.+\s(\(\(.+\)\))/;
      my $replace_me = $1;
      #print "$replace_me --> $new_string\n";
      $line =~ s/\(\(.+\)\)/$new_str/;
      print $line;
      next;
   }
   if( $line =~ /(\s+)([a-z]+)\=\$\(\((.+)\)\)/){
      #print "->>$line\n";
      my $start = "\$".$2;
      my $meat = $3;
      my $space = $1;
      my $op;
      my @items = split /\s/,$meat;
      my $new_str=$space.$start." = ";
      foreach my $item (@items){
         if ( $item =~ /[a-z]+/ ){
               $item = "\$".$item;
         }
         $new_str .= $item." ";
      }
      $new_str = $new_str.";";
      #if ( $meat =~ /([a-z0-9]+)\s(.+)\s([a-z0-9]+)/){
      #my $new_str = $space.$start." "."="." ".$var1." ".$op." ".$var2.";";
      #print "->$new_str\n";
      $line =~ s/.+/$new_str/;
      print $line;
      next;
   }
   my $done = "done";
   if ($line =~ /$done/){
      my $bracket = "}";
      $line =~ s/$done/$bracket/;
      print "$line";
      next;
   }
   my $else = "else";
   if ($line =~ /(\s*)$else/){
      print $1."} else {\n";
      next;
   }
   my $echo = "echo";
   if ( $line =~ /$echo.+/){
      $line =~ /(\s*)$echo (.+)/;
      my $new_line = $1."print \"".$2."\\n\"\;\n";
      print $new_line;
      next;
   }
   if ($line =~ /(\s*)fi/){
      print $1."}\n";
   }
}
