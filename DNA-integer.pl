#!/usr/local/bin/perl
# Mike McQuade
# DNA-integer.pl
# Computes the integer value of a DNA string.

use strict;
use warnings;

# Initialize local variable
my $genome;

# Open the file to read
open(my $fh,"<ba1l.txt") or die $!;

# Pass in the string from the file
$genome = <$fh>;
chomp($genome);

# Print out the result of the sub routine
print patternToNum($genome);

# Close the file
close($fh) || die "Couldn't close file properly";



# Recursively determines the integer value of the DNA strand
# one letter at a time
sub patternToNum {
	my $pattern = $_[0];
	
	if ($pattern eq "") {return 0;}
	my $prefix = substr($pattern,0,-1);
	my $symbol = substr($pattern,-1);
	return 4 * patternToNum($prefix) + symbolToNum($symbol);
}

# Returns an integer value for a given symbol
sub symbolToNum {
	my $symbol = $_[0];
	
	if ($symbol eq 'A') {return 0;}
	elsif ($symbol eq 'C') {return 1;}
	elsif ($symbol eq 'G') {return 2;}
	elsif ($symbol eq 'T') {return 3;}
}