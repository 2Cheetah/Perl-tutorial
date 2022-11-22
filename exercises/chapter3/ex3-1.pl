#!/usr/bin/perl
use warnings;

# My solution
# chomp(@lines = <STDIN>);
# @lines = reverse @lines;
# foreach (@lines) {
#     print "$_", "\n";
# }

# Solution from the book
print "Input lines, press Ctrl-D when finished:\n";
print reverse <STDIN>;
