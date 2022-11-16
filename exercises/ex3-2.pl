#!/usr/bin/perl
use warnings;

chomp(@numbers = <STDIN>);

@names = qw( fred betty barney dino wilma pebbles bamm-bamm );

foreach $number (@numbers) {
    print "$names[$number - 1]", "\n";
}
