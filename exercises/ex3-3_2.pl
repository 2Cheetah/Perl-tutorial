#!/usr/bin/perl
use warnings;

print sort(<STDIN>);

chomp(@lines = <STDIN>);
@sorted_lines = sort @lines;
print "@sorted_lines\n";
