#!/urs/bin/perl
use warnings;
use v5.28;

sub next_fibonacci {
    state @numbers = (0, 1);
    push @numbers, $numbers[-2] + $numbers[-1];
    print "Next Fibonacci number is: $numbers[-1]\n";
}

sub next_fibonacci_number {
    state $first_number = 0;
    state $second_number = 1;
    state $fibonacci_number = 0;
    $fibonacci_number = $first_number + $second_number;
    $first_number = $second_number;
    $second_number = $fibonacci_number;
    print "Next Fibonacci number is: $fibonacci_number\n";
}

&next_fibonacci_number;
&next_fibonacci_number;
&next_fibonacci_number;
&next_fibonacci_number;
&next_fibonacci_number;
print "\n\n";
&next_fibonacci;
&next_fibonacci;
&next_fibonacci;
&next_fibonacci;
&next_fibonacci;
