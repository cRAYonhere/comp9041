#!/usr/bin/perl -w

if ("a" eq 'a') {
	print "\"a\" eq \'a\' \n";
} else {
	print "\"a\" ne \'a\' \n";
}

if ("A" eq A) {
	print "\"A\" eq A \n";
} else {
	print "\"A\" ne A \n";
} 

if ("abc" eq 'abc') {
	print "\"abc\" is equal to \'abc\' \n";
} else {
	print "\"abc\" is NOT equal to \'abc\' \n";
}
$var1 = "its\'s";
$var2 = 'it\'s';
#if ("it\'s" eq 'it\'s') {
if ($var1 eq $var2){
	print "\"it\'s\" eq to \'it's\' \n";
} else {
	print "\"it\'s\" NOT eq to \'it\\'s\' \n";
}
if (42 == "42") {
	print "42 == \"42\" \n";
} else {
	print "42 != \"42\" \n";
}
if ("3" == "3.0"){
	print "\"3\" == \"3.0\" \n";
} else {

	print "\"3\" != \"3.0\" \n";
}
if ("3" eq "3.0"){
        print "\"3\" eq \"3.0\" \n";
} else {

        print "\"3\" ne \"3.0\" \n";
}
if ("$2.50" == '$2.50'){
	print "\"\$2.50\" == \'\$2.50\' \n";
} else {
	print "\"\$2.50\" != \'\$2.50\' \n";
}
