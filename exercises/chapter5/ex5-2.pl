#!/usr/bin/perl
use warnings;
use strict;

print "Input list of strings:\n";
chomp(my @lines = <STDIN>);
print "098765432109876543210987654321\n";
#foreach (@lines) {
  #  printf "%*s\n", 20, $_;
  #}

my $format = "%20s\n" x @lines;
printf $format, @lines;
