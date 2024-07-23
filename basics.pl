#!/usr/bin/env perl

use strict;    # Enforce strict rules on variable declaration and usage
use warnings;  # Enable warnings to help catch potential errors
use feature qw/signatures state say/;  # Import specific features for modern Perl syntax

use Data::Dumper;  # Module for printing Perl data structures for debugging

# Scalar variables - store single values of any type
my $c = 5;
my $d = 5;

# Array - stores a list of values
my @ar = (4, 3, 2, 1);
my $size = @ar;  # Number of elements in the array
@ar = sort {$a <=> $b} @ar;  # Sort array numerically
my $last_index = $#ar;  # Index of the last element in the array

# String arrays
my @str = qw/G u r u r a j a/;
my @ini = qw/S R/;
my $sz = @str;  # Number of elements in the array
push @str, @ini;  # Append elements of @ini to @str

# Hash - key-value pairs, similar to dictionaries in other languages
my %has = (a => 1, b => 2, c => 3, d => 4);

# Hash with additional key-value pairs
my %has2 = (%has, e => 5, f => 6, g => 7, h => 8);

# Size of the hash (number of key-value pairs)
my $si = %has2;

# Delete a key-value pair from the hash
delete $has2{h};

# Extract keys and values of a hash into arrays
my @keyar = keys %has;
my @valar = values %has;

# Ternary operation example
my $check = exists $has{e} ? 'yes' : 'no';

# References - scalar types that can store any type of data
# Creating references
my $c_ref = \$c;
my $ar_ref = \@ar;
my $has_ref = \%has;

# Anonymous array and hash references
my $ar_ref2 = [1, 2, 3, 4];
my $has_ref2 = {a => 1, b => 2};

# Dereferencing
my $c_deref = $$c_ref;
my @ar_deref = @$ar_ref;
my %has_deref = %$has_ref;

# Nested references
my $nestar_ref = [1, {a => 2, b => [3, 4, 5]}, [6, {c => [7, "Guru"]}]];
my $nesthas_ref = {name => {first => "Gururaja", last => "Shivagange Raghunath", preferred => "Guru"}, age => 22, languages => {Kannada => "Fluent", English => "Intermediate", Hindi => ["Speak", "Read"]}};

# Subroutines (functions)
sub add($g, $u) {
    print "Result is: ";
    print $g + $u;
}

# Example of calling a subroutine
add(2, 3);

# Subroutine modifying array reference
my @n = ("Gururaja", " ", "Raghunath");
sub name_arr {
    my $arg = shift @_;
    $arg->[1] = "Shivagange";
    print Dumper($arg);
    return undef;
}
name_arr(\@n);

# Subroutine modifying hash reference
sub test($p, $u) {
    my $n_ref = {First => "Gururaja", Last => "SR"};
    $n_ref->{$p} = $u;
    print Dumper($n_ref);
}
test("Last", "Shivagange Raghunath");

# Subroutine accessing hash elements
sub prac {
    my %h = (a => 1, b => 2, c => 3);
    print $h{$_[0]};
}
prac("a");

# Subroutine with state variable
sub itt {
    state $a = 0;
    $a += 1;
    print $a . "\n";
}
itt();
itt();
itt();
itt();

# Exception Handling using eval and die
my @f = (1, 2, 3, 4);
my $chk;
eval {
    $chk = exists $f[5] ? "Y" : "N";
    die "Something went wrong";  # Trigger error
};

# Logical Operators in conditional blocks
say "Enter password: ";
say "Password shouldn't contain any special characters or blank spaces!";
my $in = <STDIN>;
chomp($in);
my @p = split //, $in;
my @s = ("@", "#", "\$", "%");

# Conditional Operators: if, unless, ternary
foreach my $element (@s) {
    my $find = "Exists" if grep {$_ eq $element} @p;
    if ($find) {
        say "Special characters not allowed!!";
        say "Re-enter password: ";
        last;
    }
}

# Printing the second middle number of the list
my $len;
my $midl;
my @num_list;
say "Enter a set of numbers: ";
my $num_in = <STDIN>;
sub mid(@num_list) {
    @num_list = split //, $num_in;
    $len = @num_list;
    $midl = $len / 2;
    my $l = $#num_list;
    if ($midl % 2 == 0) {
        say @num_list[$midl-- .. $l];
    } elsif ($midl != 0) {
        say @num_list[$midl .. $l];
    } else {
        say "Something went wrong";
    }
}
mid(@num_list);

my $r = 2 <=> 2;
say $r;
unless ($r >= 2) {
    say "idk";
}

# Loops
# Foreach loop - palindrome program
sub palindrome($hes) {
    my @hes_ar = split //, $hes;
    my @hes2_ar = ();
    my $hes2;
    foreach my $item (@hes_ar) {
        unshift @hes2_ar, $item;  # Reversing the array
        $hes2 = join "", @hes2_ar;
    }
    say Dumper(@hes2_ar);
    say Dumper($hes2);
    if ($hes eq $hes2) {
        say "Yeppie! ", $hes, " is a Palindrome";
    } else {
        say "Sorry :/ ", $hes, " isn't a Palindrome";
        say "Try with another word";
    }
}
say "Enter the word that you want to check for palindrome status: ";
my $hes = <STDIN>;
chomp($hes);
palindrome($hes);

# While loop - iterate numbers with a gap of 10 until 100
say "Enter a number: ";
my $m = <STDIN>;
while ($m < 100) {
    say $m;
    $m += 10;
}

# For loop - iterate numbers with a gap of 10
say "Enter a number: ";
my $q = <STDIN>;
for ($q; $q < 100; $q += 10) {
    say $q;
}

# Regular Expressions
# Extracting USN of toppers
my %cgpa = (
    "1VA19EC025" => 7.7,
    "1VA19EC026" => 7.6,
    "1VA19EC028" => 8.34,
    "1VA19EC038" => 7.5,
    "1VA19EC047" => 7.6,
    "1VA19EC053" => 8.42
);
my $usn;
my $s;
my @tl;
my @avl;
sub filter {
    foreach my $k (keys %cgpa) {
        $s = $cgpa{$k};
        if ($s >= 8) {
            push @tl, $k;  # Toppers list
        } elsif ($s >= 7) {
            push @avl, $k;  # Average grades list
        }
    }
}

say "To know your class grades: ";
say "Type: 1, to know who all topped this year";
say "Type: 2, for knowing the list of students having average grades";
my $typ = <STDIN>;
if ($typ == 1) {
    say "Toppers List is loading....";
    sleep 2;
    say "List ready: ";
    filter;
    say Dumper(@tl);
} elsif ($typ == 2) {
    say "Avg List is loading....";
    sleep 2;
    say "List ready: ";
    filter;
    say Dumper(@avl);
} else {
    say "I don't know what you have typed";
    say "Try typing 1 or 2";
}

# Object-Oriented Programming
# Define a package (class)
package class;
use strict;
use warnings;

# Constructor to create a new object
sub new {
    my ($class, %args) = @_;
    my $self = {
        First => $args{First},
        Last => $args{Last},
    };
    return bless $self, $class;
}

# Method to get first name
sub getFirst {
    my $self = shift;
    return $self->{First};
}

# Method to get last name
sub getLast {
    my $self = shift;
    return $self->{Last};
}

1;  # Return true to indicate successful package loading

# Create an object and call methods
my $obj = class->new(First => "Gururaja", Last => "Shivagange Raghunath");
say "First: ", $obj->getFirst();
say "Last: ", $obj->getLast();

# More Perl features and advanced concepts

# Map and grep - functional programming constructs
my @numbers = (1, 2, 3, 4, 5, 6);
my @squares = map { $_ * $_ } @numbers;  # Square each element
my @even_numbers = grep { $_ % 2 == 0 } @numbers;  # Filter even numbers

say "Original numbers: @numbers";
say "Squared numbers: @squares";
say "Even numbers: @even_numbers";

# File Handling
# Open a file for reading
open(my $fh, '<', 'example.txt') or die "Cannot open file: $!";
while (my $line = <$fh>) {
    chomp $line;  # Remove newline character
    say $line;  # Print each line
}
close($fh);  # Close the file handle

# Open a file for writing
open(my $fw, '>', 'output.txt') or die "Cannot open file: $!";
print $fw "Hello, World!\n";  # Write to the file
close($fw);  # Close the file handle

# Open a file for appending
open(my $fa, '>>', 'output.txt') or die "Cannot open file: $!";
print $fa "Appending this line.\n";  # Append to the file
close($fa);  # Close the file handle

# Complex Data Structures
# Array of hashes
my @students = (
    { name => 'John', grade => 'A' },
    { name => 'Jane', grade => 'B' },
    { name => 'Jim', grade => 'A' },
);

# Iterate and print array of hashes
foreach my $student (@students) {
    say "Name: $student->{name}, Grade: $student->{grade}";
}

# Hash of arrays
my %subjects = (
    Math => [90, 85, 78],
    Science => [92, 88, 84],
);

# Access and print elements of hash of arrays
foreach my $subject (keys %subjects) {
    say "$subject scores: @{ $subjects{$subject} }";
}

# Hash of hashes
my %contacts = (
    'John Doe' => { phone => '123-456-7890', email => 'john@example.com' },
    'Jane Doe' => { phone => '987-654-3210', email => 'jane@example.com' },
);

# Access and print elements of hash of hashes
foreach my $person (keys %contacts) {
    say "$person - Phone: $contacts{$person}{phone}, Email: $contacts{$person}{email}";
}

# Regular Expressions for Pattern Matching
my $text = "The quick brown fox jumps over the lazy dog.";
if ($text =~ /quick/) {
    say "The word 'quick' was found.";
}

$text =~ s/quick/slow/;  # Replace 'quick' with 'slow'
say $text;

my @words = split /\s+/, $text;  # Split text into words
say "Words: @words";

# Time and Date
use POSIX qw(strftime);

my $now = strftime "%Y-%m-%d %H:%M:%S", localtime;
say "Current date and time: $now";

# Sleep for 2 seconds
sleep(2);
say "2 seconds later...";

# Command-Line Arguments
# Print all command-line arguments
foreach my $arg (@ARGV) {
    say "Argument: $arg";
}

# Using Modules and CPAN
use LWP::Simple;  # Load web content module
my $content = get("http://www.example.com");
say $content if defined $content;

# Demonstrating autodie - simplifies error handling
use autodie;

open(my $fh2, '<', 'example.txt');  # Automatically dies on failure
while (my $line2 = <$fh2>) {
    chomp $line2;
    say $line2;
}
close($fh2);

# Using JSON module for encoding and decoding JSON
use JSON;

my $json_text = '{"name": "John Doe", "age": 30, "email": "john.doe@example.com"}';
my $perl_scalar = decode_json($json_text);
say "Name: $perl_scalar->{name}, Age: $perl_scalar->{age}, Email: $perl_scalar->{email}";

my $json_output = encode_json({ key1 => 'value1', key2 => 'value2' });
say $json_output;

# Database Interaction with DBI
use DBI;

my $dsn = "DBI:mysql:database=testdb;host=localhost";
my $username = "user";
my $password = "password";

my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1 }) or die $DBI::errstr;

# Prepare and execute a SQL query
my $sth = $dbh->prepare("SELECT * FROM users");
$sth->execute();

while (my @row = $sth->fetchrow_array) {
    say "User ID: $row[0], User Name: $row[1]";
}

$sth->finish();
$dbh->disconnect();

# End of Perl script
say "Perl script execution completed.";

