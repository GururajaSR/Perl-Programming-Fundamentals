#!/usr/bin/perl
use strict;
use warnings;

# modules.pl
# Comprehensive guide to using modules in Perl

# Creating a Custom Module

# BasicModule.pm
package BasicModule;
use strict;
use warnings;

# Function to print a greeting message
sub greet {
    my ($name) = @_;
    return "Hello, $name!";
}

# Function to add two numbers
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

1;  # Return true to indicate successful loading of the module

# End of BasicModule.pm

# Using the Custom Module
package main;

use BasicModule;  # Import the custom module

# Example usage of BasicModule functions
my $greeting = BasicModule::greet("Alice");
print "$greeting\n";

my $sum = BasicModule::add(5, 10);
print "Sum: $sum\n";

# Using CPAN Modules

# Load the CPAN module for file handling
use File::Slurp;

# Read a file using File::Slurp
my $filename = 'example.txt';
my $file_content = read_file($filename);
print "File content read with File::Slurp:\n$file_content\n";

# Load the CPAN module for date and time
use Time::Piece;

# Get the current date and time
my $time = localtime;
print "Current date and time: $time\n";

# Creating a Module with Exportable Functions

# AdvancedModule.pm
package AdvancedModule;
use strict;
use warnings;
use Exporter 'import';  # Import Exporter to enable exporting functions

# Export specific functions
our @EXPORT = qw(multiply reverse_string);

# Function to multiply two numbers
sub multiply {
    my ($a, $b) = @_;
    return $a * $b;
}

# Function to reverse a string
sub reverse_string {
    my ($str) = @_;
    return reverse $str;
}

1;  # Return true to indicate successful loading of the module

# End of AdvancedModule.pm

# Using the Advanced Module
package main;

use AdvancedModule;  # Import the advanced module

# Example usage of AdvancedModule functions
my $product = AdvancedModule::multiply(4, 5);
print "Product: $product\n";

my $reversed = AdvancedModule::reverse_string("Perl");
print "Reversed string: $reversed\n";

# Advanced Module: Handling Exceptions

# AdvancedModuleWithException.pm
package AdvancedModuleWithException;
use strict;
use warnings;
use Exporter 'import';  # Import Exporter to enable exporting functions

# Export specific functions
our @EXPORT = qw(divide);

# Function to divide two numbers with error handling
sub divide {
    my ($numerator, $denominator) = @_;
    
    # Check if the denominator is zero
    if ($denominator == 0) {
        die "Error: Division by zero is not allowed.";
    }
    
    return $numerator / $denominator;
}

1;  # Return true to indicate successful loading of the module

# End of AdvancedModuleWithException.pm

# Using the Module with Exception Handling
package main;

use AdvancedModuleWithException;  # Import the advanced module with exception handling

# Example usage of AdvancedModuleWithException function
eval {
    my $result = AdvancedModuleWithException::divide(10, 2);
    print "Division result: $result\n";
};

# Print error message if an exception occurred
if ($@) {
    print "Caught exception: $@\n";
}

# End of file

