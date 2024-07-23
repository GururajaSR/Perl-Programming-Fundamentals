#!/usr/bin/perl
use strict;
use warnings;

# regex.pl
# Comprehensive guide to Perl regular expressions

# Basics of Regular Expressions

# Simple matching
my $string = "Hello, world!";
if ($string =~ /world/) {
    print "Found 'world' in the string\n";
}

# Case-insensitive matching
if ($string =~ /HELLO/i) {
    print "Found 'HELLO' in the string (case-insensitive)\n";
}

# Character classes
$string = "The cat sat on the mat.";
if ($string =~ /[csm]at/) {
    print "Found 'cat', 'sat', or 'mat' in the string\n";
}

# Negated character classes
if ($string =~ /[^csm]at/) {
    print "Found a word ending with 'at' not starting with 'c', 's', or 'm'\n";
}

# Anchors: Matching start and end of string
if ($string =~ /^The/) {
    print "String starts with 'The'\n";
}
if ($string =~ /mat\.$/) {
    print "String ends with 'mat.'\n";
}

# Quantifiers
$string = "I have 123 apples.";
if ($string =~ /\d+/) {
    print "Found one or more digits in the string\n";
}
if ($string =~ /\d{3}/) {
    print "Found exactly three digits in the string\n";
}

# Grouping and alternation
$string = "red, green, blue";
if ($string =~ /(red|green|blue)/) {
    print "Found 'red', 'green', or 'blue' in the string\n";
}

# Capturing groups
$string = "My phone number is 123-456-7890.";
if ($string =~ /(\d{3})-(\d{3})-(\d{4})/) {
    print "Captured phone number parts: $1-$2-$3\n";
}

# Named capturing groups (requires Perl 5.10 or later)
if ($string =~ /(?<area>\d{3})-(?<exchange>\d{3})-(?<line>\d{4})/) {
    print "Captured phone number parts: $+{area}-$+{exchange}-$+{line}\n";
}

# Non-capturing groups
$string = "red, green, blue";
if ($string =~ /(?:red|green|blue)/) {
    print "Found 'red', 'green', or 'blue' in the string (non-capturing)\n";
}

# Advanced Regular Expressions

# Lookahead and Lookbehind assertions
$string = "foobar";
if ($string =~ /foo(?=bar)/) {
    print "Found 'foo' followed by 'bar' (lookahead)\n";
}
if ($string =~ /(?<=foo)bar/) {
    print "Found 'bar' preceded by 'foo' (lookbehind)\n";
}

# Modifiers
$string = "Hello\nWorld";
if ($string =~ /Hello.World/s) {
    print "Found 'Hello' followed by any character and 'World' (dot matches newline)\n";
}

# Greedy vs. non-greedy matching
$string = "<b>Bold text</b>";
if ($string =~ /<.*>/) {
    print "Greedy match: $&\n";
}
if ($string =~ /<.*?>/) {
    print "Non-greedy match: $&\n";
}

# Substitutions
$string = "The cat sat on the mat.";
$string =~ s/cat/dog/;
print "After substitution: $string\n";

# Global substitutions
$string = "The cat sat on the cat.";
$string =~ s/cat/dog/g;
print "After global substitution: $string\n";

# Using regex in functions
sub extract_phone_number {
    my ($text) = @_;
    if ($text =~ /(\d{3})-(\d{3})-(\d{4})/) {
        return "$1-$2-$3";
    }
    return undef;
}

my $phone = extract_phone_number("My number is 123-456-7890.");
print "Extracted phone number: $phone\n";

# Using regex in list context
$string = "one, two, three";
my @words = split(/, /, $string);
print "Split string into words: @words\n";

# Regex with complex replacements
$string = "the quick brown fox jumps over the lazy dog";
$string =~ s/\b(\w)/\U$1/g;
print "After complex replacement (capitalize words): $string\n";

# Using the /x modifier for readability
$string = "John Doe, 123-456-7890";
if ($string =~ /(\d{3}) - (\d{3}) - (\d{4}) /x) {
    print "Found phone number: $1-$2-$3\n";
}

# End of file

