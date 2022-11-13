#!usr/bin/perl
use v5.36;

print -10 % 3, "\n";
print "\x{2668}\n";
print "\N{SNOWMAN}\n";
print "\LALL CAP LETTERS\E\n\n";

print 5 x 4.8 . "\n";

print "12fred32" * 3 . "\n";
print "fred" * "3" . "\n";
print "Z" . "7" * 3 . "\n";

print "The answer is ";
print 6 * 7;
print ".\n";
print "The answer is ", 6 * 7, ".\n";
say "The answer is ", 6 * 7, ".";

my $what = "brontosaurus steak";
my $n = 3;
print "fred ate $n ${what}s.\n";

say chr( 0x05D0 ); # א
say chr( 215 );
say chr( hex('03B1') ); # α
say chr( 0x03C9 ); # ω

say ord( 'א' );