#!/usr/bin/perl
use warnings;

@fred = qw(eating rocks is wrong);
$fred = "right";
print "this is $fred[3]\n";
print "this is ${fred}[3]\n";
print "this is $fred"."[3]\n";
print "this is $fred\[3]\n";

@rocks = qw( bedrock slate lava );
foreach $rock (@rocks) {
    $rock = "\t$rock";
    $rock .= "\n";
}
print "The rocks are:\n", @rocks;

print "example on each operator\n";
@rocks = qw\ one two three four \;
while( ( $index, $value ) = each @rocks ) {
    print "$index: $value\n";
}

print "same as previous example on each operator, but using foreach operator\n";
foreach $index (0..$#rocks) {
    print "$index: $rocks[$index]\n";
}

$socks[0] = 'red';
$socks[1] = 'blue';
$socks[10] = 'black';
print "$#socks\n";
foreach $sock (@socks) {
    print "$sock\n";
}
