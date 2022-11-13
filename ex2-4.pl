#!/usr/bin/perl
use warnings;
print "Enter first number: ";
chomp($a = <STDIN>);
print "Enter second number: ";
chomp($b = <STDIN>);
$result = $a * $b;
print "Product of these two numbers: ${result}\n";