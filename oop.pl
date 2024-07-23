#!/usr/bin/perl
use strict;
use warnings;

# oop.pl
# Comprehensive guide to Object-Oriented Programming in Perl

# Basics of Object-Oriented Programming

# Define a basic class
package Person;

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = {
        name => $args{name} || 'Unknown',
        age  => $args{age}  || 0,
    };
    bless $self, $class;
    return $self;
}

# Method to get the person's name
sub get_name {
    my ($self) = @_;
    return $self->{name};
}

# Method to set the person's name
sub set_name {
    my ($self, $name) = @_;
    $self->{name} = $name;
}

# Method to get the person's age
sub get_age {
    my ($self) = @_;
    return $self->{age};
}

# Method to set the person's age
sub set_age {
    my ($self, $age) = @_;
    $self->{age} = $age;
}

# Method to display person's info
sub display_info {
    my ($self) = @_;
    print "Name: " . $self->get_name() . ", Age: " . $self->get_age() . "\n";
}

# End of Person package
package main;

# Create a new Person object
my $person = Person->new(name => 'Alice', age => 30);
$person->display_info();

# Update the person's information
$person->set_name('Bob');
$person->set_age(40);
$person->display_info();

# Inheritance

# Define a subclass of Person
package Employee;
our @ISA = qw(Person);  # Inherit from Person

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);  # Call the parent constructor
    $self->{employee_id} = $args{employee_id} || 'N/A';
    bless $self, $class;
    return $self;
}

# Method to get the employee ID
sub get_employee_id {
    my ($self) = @_;
    return $self->{employee_id};
}

# Method to set the employee ID
sub set_employee_id {
    my ($self, $id) = @_;
    $self->{employee_id} = $id;
}

# Overriding display_info method to include employee ID
sub display_info {
    my ($self) = @_;
    $self->SUPER::display_info();  # Call the parent method
    print "Employee ID: " . $self->get_employee_id() . "\n";
}

# End of Employee package
package main;

# Create a new Employee object
my $employee = Employee->new(name => 'Charlie', age => 35, employee_id => 'E12345');
$employee->display_info();

# Polymorphism and Method Overriding

# Define another subclass of Person
package Student;
our @ISA = qw(Person);  # Inherit from Person

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);  # Call the parent constructor
    $self->{student_id} = $args{student_id} || 'N/A';
    bless $self, $class;
    return $self;
}

# Method to get the student ID
sub get_student_id {
    my ($self) = @_;
    return $self->{student_id};
}

# Method to set the student ID
sub set_student_id {
    my ($self, $id) = @_;
    $self->{student_id} = $id;
}

# Overriding display_info method to include student ID
sub display_info {
    my ($self) = @_;
    $self->SUPER::display_info();  # Call the parent method
    print "Student ID: " . $self->get_student_id() . "\n";
}

# End of Student package
package main;

# Create a new Student object
my $student = Student->new(name => 'Diana', age => 22, student_id => 'S67890');
$student->display_info();

# Advanced OOP Features

# Define a class with a method that uses a private variable
package BankAccount;

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = {
        balance => $args{balance} || 0,
    };
    bless $self, $class;
    return $self;
}

# Method to deposit money
sub deposit {
    my ($self, $amount) = @_;
    if ($amount > 0) {
        $self->{balance} += $amount;
        print "Deposited $amount, new balance: $self->{balance}\n";
    } else {
        print "Invalid deposit amount\n";
    }
}

# Method to withdraw money
sub withdraw {
    my ($self, $amount) = @_;
    if ($amount > 0 && $amount <= $self->{balance}) {
        $self->{balance} -= $amount;
        print "Withdrew $amount, new balance: $self->{balance}\n";
    } else {
        print "Invalid withdrawal amount or insufficient funds\n";
    }
}

# Method to get balance
sub get_balance {
    my ($self) = @_;
    return $self->{balance};
}

# End of BankAccount package
package main;

# Create a new BankAccount object
my $account = BankAccount->new(balance => 1000);
$account->deposit(500);
$account->withdraw(200);
print "Current balance: " . $account->get_balance() . "\n";

# Multiple Inheritance (Note: Perl supports multiple inheritance with some caveats)

# Define a class with multiple inheritance
package PersonWithContact;
our @ISA = qw(Person);

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = $class->SUPER::new(%args);
    $self->{email} = $args{email} || 'noemail@example.com';
    bless $self, $class;
    return $self;
}

# Method to get email
sub get_email {
    my ($self) = @_;
    return $self->{email};
}

# Method to set email
sub set_email {
    my ($self, $email) = @_;
    $self->{email} = $email;
}

# Overriding display_info method to include email
sub display_info {
    my ($self) = @_;
    $self->SUPER::display_info();
    print "Email: " . $self->get_email() . "\n";
}

# End of PersonWithContact package
package main;

# Create a new PersonWithContact object
my $contact_person = PersonWithContact->new(name => 'Eve', age => 28, email => 'eve@example.com');
$contact_person->display_info();

# End of file

