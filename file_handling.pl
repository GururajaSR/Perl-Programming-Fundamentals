#!/usr/bin/perl
use strict;
use warnings;

# file_handling.pl
# Comprehensive guide to file handling in Perl

# Basic File Operations

# Writing to a file
package BasicFileOps;

sub write_to_file {
    my ($filename, $content) = @_;
    
    # Open file for writing (creates or overwrites the file)
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    
    # Print content to the file
    print $fh $content;
    
    # Close the file handle
    close $fh;
    
    print "Content written to '$filename'.\n";
}

# Reading from a file
sub read_from_file {
    my ($filename) = @_;
    
    # Open file for reading
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    
    # Read file content
    my $content = do { local $/; <$fh> };
    
    # Close the file handle
    close $fh;
    
    return $content;
}

# Appending to a file
sub append_to_file {
    my ($filename, $content) = @_;
    
    # Open file for appending
    open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
    
    # Print content to the file
    print $fh $content;
    
    # Close the file handle
    close $fh;
    
    print "Content appended to '$filename'.\n";
}

# End of BasicFileOps package
package main;

# Example usage of basic file operations

my $filename = 'example.txt';

# Write to file
BasicFileOps::write_to_file($filename, "This is the initial content.\n");

# Read from file
my $content = BasicFileOps::read_from_file($filename);
print "File content:\n$content";

# Append to file
BasicFileOps::append_to_file($filename, "This is appended content.\n");

# Read again to see the appended content
$content = BasicFileOps::read_from_file($filename);
print "Updated file content:\n$content";

# Advanced File Handling

# Reading a file line by line
package AdvancedFileOps;

sub read_lines {
    my ($filename) = @_;
    
    # Open file for reading
    open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
    
    # Read file line by line
    my @lines = <$fh>;
    
    # Close the file handle
    close $fh;
    
    return @lines;
}

# Writing multiple lines to a file
sub write_lines {
    my ($filename, @lines) = @_;
    
    # Open file for writing (creates or overwrites the file)
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    
    # Print each line to the file
    print $fh $_ for @lines;
    
    # Close the file handle
    close $fh;
    
    print "Multiple lines written to '$filename'.\n";
}

# End of AdvancedFileOps package
package main;

# Example usage of advanced file operations

my $lines_filename = 'lines_example.txt';

# Write multiple lines to file
AdvancedFileOps::write_lines($lines_filename, "First line.\n", "Second line.\n", "Third line.\n");

# Read lines from file
my @lines = AdvancedFileOps::read_lines($lines_filename);
print "Lines read from file:\n";
print $_ for @lines;

# File Handling with Error Checking

# Reading a file with error handling
package FileOpsWithErrorHandling;

sub read_file_safely {
    my ($filename) = @_;
    
    # Try to open the file for reading
    open(my $fh, '<', $filename) or return "Could not open file '$filename': $!";
    
    # Try to read the file content
    my $content = do { local $/; <$fh> };
    
    # Close the file handle
    close $fh;
    
    return $content;
}

# Writing to a file with error handling
sub write_file_safely {
    my ($filename, $content) = @_;
    
    # Try to open the file for writing
    open(my $fh, '>', $filename) or return "Could not open file '$filename': $!";
    
    # Try to print the content to the file
    print $fh $content;
    
    # Close the file handle
    close $fh;
    
    return "Content written to '$filename'.";
}

# End of FileOpsWithErrorHandling package
package main;

# Example usage of file handling with error checking

my $error_filename = 'error_example.txt';

# Attempt to write to file
my $result = FileOpsWithErrorHandling::write_file_safely($error_filename, "Content with error handling.\n");
print "$result\n";

# Attempt to read from file
my $safe_content = FileOpsWithErrorHandling::read_file_safely($error_filename);
if ($safe_content =~ /^Could not/) {
    print "$safe_content\n";  # Error message
} else {
    print "Safe file content:\n$safe_content";
}

# End of file

