#!/usr/bin/perl
use warnings;

sub above_average {
    my $average = 0;
    my $sum = 0;
    my $count = @_;
    my @above_average = ();
    foreach (@_) { $sum += $_ }
    $average = $sum / $count;
    foreach (@_) {
        if ($_ > $average) {push @above_average, $_}
    }
    @above_average;
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";

my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
