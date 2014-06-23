#!/usr/bin/perl

$a="abcd";
chop($a);
print "chop $a\n";

$a="abcd";
chomp($a);
print "chomp $a\n";

$a="abc\n";
chop($a);
print "chop $a|";
$a="abc\n";
chomp($a);
print "chomp $a|";

$a="ab\n\n\n";
$/="";
chomp($a);
print "chomp many $a\n";

$/="cd";
$a="abcd";
chop($a);
print "chop $a|";

$a="abcd";
chomp($a);
print "chomp $a|";