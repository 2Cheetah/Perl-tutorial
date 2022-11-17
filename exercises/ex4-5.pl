#!/usr/bin/perl
use warnings;
use v5.28;

sub greet {
    state @persons;
    my $name = shift;
    if (@persons) {
        print "Hi $name! I've seen: @persons\n";
        push @persons, $name;
    } else {
        print "Hi $name! You are the first one here!\n";
        push @persons, $name;
    }
}

&greet( "Fred" );
&greet("Barney");
&greet("Wilma");
&greet("Betty");
