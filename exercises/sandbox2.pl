#!/usr/bin/perl
use warnings;
use v5.10;

$n = 120;

sub marine {
    state $n = 0;
    $n += 1;
    print "Hello, sailor number $n!\n";
}

&marine;
&marine;
print "Global value of \$n is $n.\n";
