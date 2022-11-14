#!/usr/bin/perl
use warnings;

print "Enter a string: ";
$string = <STDIN>;

print "Enter a number: ";
chomp($number = <STDIN>);

$result_string = $string x $number;
print "Final string:\n${result_string}";