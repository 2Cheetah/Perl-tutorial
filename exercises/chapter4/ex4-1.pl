#!/usr/bin/perl
use warnings;

sub total {
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}

# print "Sum of numbers from 1 to 10: ", &total(1..10), "\n";
# print "Sum of numbers from 1 to 20: ", &total(1..20), "\n";

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = &total(@fred);
print "The total of \@fred is $fred_total.\n";

print "Enter some numbers on separate lines:\n";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";
