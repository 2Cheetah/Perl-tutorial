#!/usr/bin/perl
use warnings;

print "Enter radius of a circle: \n";
chomp($radius = <STDIN>);
$pi = 3.141592654;
$circumference = 2 * $pi * $radius;

print "Circumference of a circle of radius ${radius} equals to: ${circumference}.\n";