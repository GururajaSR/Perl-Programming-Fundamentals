#!/usr/bin/env perl

use strict;
use warnings;

# 1. Two Sum
# Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
package TwoSum;

sub new {
    my ($class, $nums, $target) = @_;
    my $self = { nums => $nums, target => $target };
    bless $self, $class;
    return $self;
}

sub two_sum {
    my ($self) = @_;
    my %hash;
    my $nums = $self->{nums};
    my $target = $self->{target};

    for my $i (0 .. @$nums - 1) {
        my $complement = $target - $nums->[$i];
        if (exists $hash{$complement}) {
            return ($hash{$complement}, $i);
        }
        $hash{$nums->[$i]} = $i;
    }
    return;
}

# 2. Add Two Numbers
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
package AddTwoNumbers;

sub new {
    my ($class, $l1, $l2) = @_;
    my $self = { l1 => $l1, l2 => $l2 };
    bless $self, $class;
    return $self;
}

sub add_two_numbers {
    my ($self) = @_;
    my $l1 = $self->{l1};
    my $l2 = $self->{l2};
    my $dummy_head = { val => 0, next => undef };
    my $current = $dummy_head;
    my $carry = 0;

    while ($l1 || $l2 || $carry) {
        my $sum = $carry;
        $sum += $l1->{val} if $l1;
        $sum += $l2->{val} if $l2;
        $carry = int($sum / 10);
        $current->{next} = { val => $sum % 10, next => undef };
        $current = $current->{next};
        $l1 = $l1->{next} if $l1;
        $l2 = $l2->{next} if $l2;
    }

    return $dummy_head->{next};
}

# 3. Longest Substring Without Repeating Characters
# Given a string `s`, find the length of the longest substring without repeating characters.
package LongestSubstring;

sub new {
    my ($class, $s) = @_;
    my $self = { s => $s };
    bless $self, $class;
    return $self;
}

sub length_of_longest_substring {
    my ($self) = @_;
    my $s = $self->{s};
    my %map;
    my $start = 0;
    my $max_length = 0;

    for my $i (0 .. length($s) - 1) {
        my $char = substr($s, $i, 1);
        if (exists $map{$char} && $map{$char} >= $start) {
            $start = $map{$char} + 1;
        }
        $map{$char} = $i;
        $max_length = $i - $start + 1 if ($i - $start + 1) > $max_length;
    }

    return $max_length;
}

# 4. Median of Two Sorted Arrays
# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
package MedianSortedArrays;

sub new {
    my ($class, $nums1, $nums2) = @_;
    my $self = { nums1 => $nums1, nums2 => $nums2 };
    bless $self, $class;
    return $self;
}

sub find_median_sorted_arrays {
    my ($self) = @_;
    my $nums1 = $self->{nums1};
    my $nums2 = $self->{nums2};
    my @merged = (sort { $a <=> $b } (@$nums1, @$nums2));
    my $len = scalar @merged;

    if ($len % 2 == 0) {
        return ($merged[$len / 2 - 1] + $merged[$len / 2]) / 2;
    } else {
        return $merged[int($len / 2)];
    }
}

# 5. Longest Palindromic Substring
# Given a string `s`, return the longest palindromic substring in `s`.
package LongestPalindromicSubstring;

sub new {
    my ($class, $s) = @_;
    my $self = { s => $s };
    bless $self, $class;
    return $self;
}

sub longest_palindrome {
    my ($self) = @_;
    my $s = $self->{s};
    my $len = length($s);
    my $start = 0;
    my $max_len = 1;

    for my $i (0 .. $len - 1) {
        my $l = $i;
        my $r = $i;

        while ($l >= 0 && $r < $len && substr($s, $l, 1) eq substr($s, $r, 1)) {
            $l--;
            $r++;
        }
        $l++;
        $r--;
        if (($r - $l + 1) > $max_len) {
            $start = $l;
            $max_len = $r - $l + 1;
        }
    }

    return substr($s, $start, $max_len);
}

# 6. Reverse Integer
# Given a 32-bit signed integer, reverse digits of an integer.
package ReverseInteger;

sub new {
    my ($class, $x) = @_;
    my $self = { x => $x };
    bless $self, $class;
    return $self;
}

sub reverse {
    my ($self) = @_;
    my $x = $self->{x};
    my $rev = 0;
    while ($x != 0) {
        my $pop = $x % 10;
        $x = int($x / 10);
        return 0 if $rev > (2**31 - 1) / 10 || ($rev == (2**31 - 1) / 10 && $pop > 7);
        return 0 if $rev < -2**31 / 10 || ($rev == -2**31 / 10 && $pop < -8);
        $rev = $rev * 10 + $pop;
    }
    return $rev;
}

# 7. String to Integer (atoi)
# Implement the `atoi` function, which converts a string to an integer.
package StringToInteger;

sub new {
    my ($class, $str) = @_;
    my $self = { str => $str };
    bless $self, $class;
    return $self;
}

sub my_atoi {
    my ($self) = @_;
    my $str = $self->{str};
    $str =~ s/^\s+//;
    $str =~ s/^\+//;
    $str =~ s/^0+//;
    $str =~ s/\D.*//;

    if ($str =~ /^(\d+)/) {
        my $num = $1;
        return $num > 2**31 - 1 ? 2**31 - 1 : ($num < -2**31 ? -2**31 : $num);
    }
    return 0;
}

# 8. Palindrome Number
# Given an integer x, return true if x is a palindrome, and false otherwise.
package PalindromeNumber;

sub new {
    my ($class, $x) = @_;
    my $self = { x => $x };
    bless $self, $class;
    return $self;
}

sub is_palindrome {
    my ($self) = @_;
    my $x = $self->{x};
    return 0 if $x < 0;
    my $original = $x;
    my $reversed = 0;

    while ($x > 0) {
        my $pop = $x % 10;
        $x = int($x / 10);
        $reversed = $reversed * 10 + $pop;
    }

    return $reversed == $original;
}

# 9. Regular Expression Matching
# Implement regular expression matching with support for '.' and '*'.
package RegexMatching;

sub new {
    my ($class, $s, $p) = @_;
    my $self = { s => $s, p => $p };
    bless $self, $class;
    return $self;
}

sub is_match {
    my ($self) = @_;
    my $s = $self->{s};
    my $p = $self->{p};

    my $dp = [];
    $dp->[0][0] = 1;

    for my $j (1 .. length($p)) {
        $dp->[0][$j] = $dp->[0][$j - 1] && substr($p, $j - 1, 1) eq '*';
    }

    for my $i (1 .. length($s)) {
        for my $j (1 .. length($p)) {
            if (substr($p, $j - 1, 1) eq '*') {
                $dp->[$i][$j] = $dp->[$i][$j - 1] || ($dp->[$i - 1][$j] && (substr($p, $j - 2, 1) eq substr($s, $i - 1, 1) || substr($p, $j - 2, 1) eq '.'));
            } else {
                $dp->[$i][$j] = $dp->[$i - 1][$j - 1] && (substr($p, $j - 1, 1) eq substr($s, $i - 1, 1) || substr($p, $j - 1, 1) eq '.');
            }
        }
    }

    return $dp->[length($s)][length($p)];
}

# Example Usage
package main;

# Two Sum
my $nums1 = [2, 7, 11, 15];
my $target1 = 9;
my $ts = TwoSum->new($nums1, $target1);
say "Two Sum: ", join(", ", $ts->two_sum());

# Add Two Numbers
my $l1 = { val => 2, next => { val => 4, next => { val => 3, next => undef } } };
my $l2 = { val => 5, next => { val => 6, next => { val => 4, next => undef } } };
my $atn = AddTwoNumbers->new($l1, $l2);
my $result_l2n = $atn->add_two_numbers();
while ($result_l2n) {
    print "Add Two Numbers: ", $result_l2n->{val}, " ";
    $result_l2n = $result_l2n->{next};
}
print "\n";

# Longest Substring Without Repeating Characters
my $s = "abcabcbb";
my $ls = LongestSubstring->new($s);
say "Longest Substring Without Repeating Characters: ", $ls->length_of_longest_substring();

# Median of Two Sorted Arrays
my $nums1 = [1, 3];
my $nums2 = [2];
my $msa = MedianSortedArrays->new($nums1, $nums2);
say "Median of Two Sorted Arrays: ", $msa->find_median_sorted_arrays();

# Longest Palindromic Substring
my $s = "babad";
my $lps = LongestPalindromicSubstring->new($s);
say "Longest Palindromic Substring: ", $lps->longest_palindrome();

# Reverse Integer
my $x = 123;
my $ri = ReverseInteger->new($x);
say "Reverse Integer: ", $ri->reverse();

# String to Integer (atoi)
my $str = "42";
my $statoi = StringToInteger->new($str);
say "String to Integer (atoi): ", $statoi->my_atoi();

# Palindrome Number
my $x = 121;
my $pn = PalindromeNumber->new($x);
say "Palindrome Number: ", $pn->is_palindrome() ? 'true' : 'false';

# Regular Expression Matching
my $s = "aab";
my $p = "c*a*b";
my $rm = RegexMatching->new($s, $p);
say "Regular Expression Matching: ", $rm->is_match() ? 'true' : 'false';

# End of file
