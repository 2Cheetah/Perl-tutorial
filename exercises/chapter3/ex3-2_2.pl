#!/usr/bin/perl
use warnings;

if (<STDIN> < 1) or (<STDIN> > 7) {
    print "Input values must be between 1 and 7.\n";
}
else {
    chomp(@numbers = <STDIN>);
    @names = qw( fred betty barney dino wilma pebbles bamm-bamm );
    foreach $number (@numbers) {
        print "$names[$number - 1]", "\n";
    }
}
