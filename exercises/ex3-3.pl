#!/usr/bin/perl
use warnings;

chomp(@lines = <STDIN>);

print sort(@lines), "\n";

foreach $line (sort(@lines)) {
    print "$line", " ";
}
print "\n";

foreach $line (sort(@lines)) {
    print "$line", "\n";
}
