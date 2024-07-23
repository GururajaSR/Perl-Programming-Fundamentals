#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;
use GD::Graph::lines;
use Getopt::Long;

# ============================================================================
# Data Analysis Tool
# ============================================================================
# This Perl script reads data from a CSV file, performs data filtering, 
# aggregation, and generates charts. It demonstrates the usage of Perl 
# modules for data manipulation and visualization.

# ============================================================================
# Data Ingestion
# ============================================================================
# Function to read data from a CSV file
sub read_csv {
    my ($file) = @_;
    my $csv = Text::CSV->new();
    open my $fh, '<', $file or die "Could not open '$file' $!\n";
    my @data;
    while (my $row = $csv->getline($fh)) {
        push @data, $row;
    }
    close $fh;
    return \@data;
}

# ============================================================================
# Data Filtering
# ============================================================================
# Function to filter data based on a condition
sub filter_data {
    my ($data, $column, $value) = @_;
    my @filtered = grep { $_->[$column] eq $value } @$data;
    return \@filtered;
}

# ============================================================================
# Data Aggregation
# ============================================================================
# Function to compute the mean of a column
sub compute_mean {
    my ($data, $column) = @_;
    my $total = 0;
    my $count = 0;
    foreach my $row (@$data) {
        $total += $row->[$column];
        $count++;
    }
    return $total / $count;
}

# ============================================================================
# Chart Generation
# ============================================================================
# Function to create a chart from data
sub create_chart {
    my ($data, $output_file) = @_;
    my @x_data = map { $_->[0] } @$data;  # Example: x-axis data
    my @y_data = map { $_->[1] } @$data;  # Example: y-axis data

    my $graph = GD::Graph::lines->new(800, 600);
    $graph->set(
        x_label           => 'X Axis',
        y_label           => 'Y Axis',
        title             => 'Sample Chart',
        y_max_value       => 50,
        y_min_value       => 0,
        y_tick_number     => 10,
        y_label_skip      => 2,
        line_width        => 2,
        markers           => [1, 5],
        dclrs             => ['blue'],
    );

    my @data = ( \@x_data, \@y_data );
    my $gd = $graph->plot(\@data) or die $graph->error;
    open my $out, '>', $output_file or die "Cannot open '$output_file' for write: $!\n";
    binmode $out;
    print $out $gd->png;
    close $out;
}

# ============================================================================
# Main Program
# ============================================================================
# Parse command-line options
my $file;
my $operation;

GetOptions(
    'file=s'      => \$file,
    'operation=s' => \$operation,
) or die "Error in command line arguments\n";

# Validate required arguments
die "File argument is required\n" unless $file;
die "Operation argument is required\n" unless $operation;

# Read data from CSV file
my $data = read_csv($file);

# Perform operations based on user input
if ($operation eq 'filter') {
    my $filtered_data = filter_data($data, 2, 'SomeValue');
    # Print or process filtered data as needed
    print "Filtered Data:\n";
    foreach my $row (@$filtered_data) {
        print join(', ', @$row), "\n";
    }
} elsif ($operation eq 'aggregate') {
    my $mean = compute_mean($data, 3);
    print "Mean: $mean\n";
} elsif ($operation eq 'chart') {
    create_chart($data, 'chart.png');
    print "Chart generated as 'chart.png'\n";
} else {
    die "Unknown operation: $operation\n";
}

#End of File
