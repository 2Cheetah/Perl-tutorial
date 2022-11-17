#!/usr/bin/perl
use warnings;
use v5.28;

sub greet {
    state $last_person; 
    my $name = shift;
    print "Hi $name! ";
    if (defined $last_person) {
        print "$last_person is also here!\n";
    } else {
        print "You are the first one here!\n";
        $last_person = $name;
    }
}

&greet( "Fred" );
&greet("Barney");
