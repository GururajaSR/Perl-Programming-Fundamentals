#!/usr/bin/perl
use strict;
use warnings;

# data_structures.pl
# Comprehensive guide to Perl data structures

# Scalars
# Scalars are single units of data, such as a number or a string.
my $scalar = "Hello, World!";
print "Scalar: $scalar\n";

# Arrays
# Arrays are ordered lists of scalars.
my @array = (1, 2, 3, 4, 5);
print "Array: @array\n";

# Accessing array elements
print "First element: $array[0]\n";
print "Last element: $array[-1]\n";

# Adding elements to arrays
push(@array, 6);
print "Array after push: @array\n";

# Removing elements from arrays
my $popped = pop(@array);
print "Popped element: $popped\n";
print "Array after pop: @array\n";

# Hashes
# Hashes are unordered sets of key-value pairs.
my %hash = (
    'name' => 'Alice',
    'age' => 30,
    'email' => 'alice@example.com'
);
print "Hash: \n";
while (my ($key, $value) = each %hash) {
    print "$key: $value\n";
}

# Accessing hash elements
print "Name: $hash{'name'}\n";

# Adding elements to hashes
$hash{'address'} = '123 Main St';
print "Hash after adding address: \n";
while (my ($key, $value) = each %hash) {
    print "$key: $value\n";
}

# Removing elements from hashes
delete $hash{'email'};
print "Hash after deleting email: \n";
while (my ($key, $value) = each %hash) {
    print "$key: $value\n";
}

# Complex data structures
# Arrays of arrays (2D arrays)
my @matrix = (
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
);
print "2D Array (Matrix): \n";
for my $row (@matrix) {
    print "@$row\n";
}

# Accessing elements in a 2D array
print "Element at (1,2): $matrix[1][2]\n";

# Arrays of hashes
my @array_of_hashes = (
    {'name' => 'Bob', 'age' => 25},
    {'name' => 'Carol', 'age' => 27}
);
print "Array of Hashes: \n";
for my $hash_ref (@array_of_hashes) {
    print "Name: $hash_ref->{'name'}, Age: $hash_ref->{'age'}\n";
}

# Hashes of arrays
my %hash_of_arrays = (
    'fruits' => ['apple', 'banana', 'cherry'],
    'vegetables' => ['carrot', 'broccoli']
);
print "Hash of Arrays: \n";
for my $key (keys %hash_of_arrays) {
    print "$key: @{$hash_of_arrays{$key}}\n";
}

# Hashes of hashes
my %hash_of_hashes = (
    'person1' => {'name' => 'Dave', 'age' => 40},
    'person2' => {'name' => 'Eve', 'age' => 35}
);
print "Hash of Hashes: \n";
for my $person (keys %hash_of_hashes) {
    print "$person: \n";
    for my $key (keys %{$hash_of_hashes{$person}}) {
        print "  $key: $hash_of_hashes{$person}{$key}\n";
    }
}

# Using references to create complex data structures
# References are scalars that hold the memory address of another value.
my $array_ref = \@array;
print "Array reference: @$array_ref\n";

my $hash_ref = \%hash;
print "Hash reference: \n";
while (my ($key, $value) = each %$hash_ref) {
    print "$key: $value\n";
}

# Anonymous data structures
# Creating anonymous arrays and hashes using references
my $anonymous_array = [10, 20, 30];
print "Anonymous array: @$anonymous_array\n";

my $anonymous_hash = {'key1' => 'value1', 'key2' => 'value2'};
print "Anonymous hash: \n";
while (my ($key, $value) = each %$anonymous_hash) {
    print "$key: $value\n";
}

# Advanced data structures: Using modules
# Perl has several modules that provide advanced data structures.
use Data::Dumper;
my $complex_structure = {
    'array' => [1, 2, 3],
    'hash' => {'a' => 1, 'b' => 2},
    'mixed' => [{'x' => 10}, [20, 30]]
};
print "Complex structure using Data::Dumper: \n";
print Dumper($complex_structure);

# End of file

