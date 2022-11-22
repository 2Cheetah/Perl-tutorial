#!/usr/bin/perl
use warnings;
use strict;

print "Enter column width:\n";
chomp(my $column_width = <STDIN>);

print "Input list of strings:\n";
chomp(my @lines = <STDIN>);

my $ruler = '';

foreach (1..$column_width) {
  $ruler .= ($_ % 10);
}

print "$ruler\n";
foreach (@lines) {
  printf "%*s\n", $column_width, $_;
}
