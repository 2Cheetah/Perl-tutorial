#!/usr/bin/perl
use warnings;

@fred = qw(eating rocks is wrong);
$fred = "right";
print "this is $fred[3]\n";
print "this is ${fred}[3]\n";
print "this is $fred"."[3]\n";
print "this is $fred\[3]\n";

@rocks = qw( bedrock slate lava );
foreach $rock (@rocks) {
    $rock = "\t$rock";
    $rock .= "\n";
}
print "The rocks are:\n", @rocks;


