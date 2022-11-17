#!/usr/bin/perl
use warnings;

#while (defined($line = <STDIN>)) {
#    print "I saw $line";
#}

#foreach (<STDIN>) {
#    print "I saw $_";
#}

while (<>) {
    chomp;
    print "It was \"$_\" that I saw.\n";
}
