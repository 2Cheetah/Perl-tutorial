#!/usr/bin/perl
use warnings;

@numbers = qw( one two three four );
print "print '\@numbers' gives:\n";
print '@numbers';
print "\n\n";

print "print \$numbers gives:\n";
print $numbers;

print "print \"\$numbers[2]\" gives:\n";
print "$numbers[2]";
print "\n\n";

print "print \"\$#numbers\" gives:\n";
print "$#numbers";
print "\n\n";

print "print \"\@numbers\" gives:\n";
print "@numbers\n\n";

print "print \"\$numbers\" gives:\n";
print "$numbers\n\n";

print "print \"\@numbers\" . \\n gives:\n";
print "@numbers" . "\n\n";

print "print \@numbers . \\n gives:\n";
print @numbers . "\n\n";

print "print \"\@numbers\" , \\n gives:\n";
print "@numbers" , "\n\n";

print "print \@numbers , \\n gives:\n";
print @numbers , "\n\n";
