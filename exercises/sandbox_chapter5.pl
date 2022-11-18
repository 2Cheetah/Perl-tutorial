#!/usr/bin/perl
use warnings;
use Getopt::Long;

#while (defined($line = <STDIN>)) {
#    print "I saw $line";
#}

#foreach (<STDIN>) {
#    print "I saw $_";
#}

#while (<>) {
#    chomp;
#    print "It was \"$_\" that I saw.\n";
#}

my $verbose = '';
my $all = '';
my $tag = '';

GetOptions ('verbose!' => \$verbose, 'all!' => \$all, 'tag=s' => \$tag);
print "Verbose option is $verbose\n";
print "All option is $all\n";
print "Tag is $tag\n";
