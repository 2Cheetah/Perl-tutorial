#!/usr/bin/perl
use warnings;

print "Enter radius of a circle: ";
chomp($radius = <STDIN>);
$pi = 3.141592654;
$circumference = 2 * $pi * $radius;
if ($radius < 0) {
    $circumference = 0;
}
print "Circumference of a circle of radius ${radius} equals to: ${circumference}.\n";
