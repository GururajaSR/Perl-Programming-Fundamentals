# Perl Programming Fundamentals

Welcome to the **Perl Programming Fundamentals** repository! This repository contains a collection of Perl scripts that I wrote while learning Perl. These scripts demonstrate the basics and more advanced concepts of Perl programming. Each file focuses on a specific topic and provides examples and explanations to help you understand Perl better.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [File Descriptions](#file-descriptions)
  - [basics.pl](#basicspl)
  - [basic_syntax.pl](#basic_syntaxpl)
  - [data_analysis.pl](#data_analysispl)
  - [data_structures.pl](#data_structurespl)
  - [file_handling.pl](#file_handlingpl)
  - [leet_code.pl](#leet_codepl)
  - [modules.pl](#modulespl)
  - [oop.pl](#ooppl)
  - [regex.pl](#regexpl)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Perl is a high-level, general-purpose, interpreted, dynamic programming language known for its flexibility and versatility. This repository is designed to help you grasp the fundamental concepts of Perl programming through practical examples.

## Getting Started

To get started with these scripts, you will need to have Perl installed on your system. You can download and install Perl from the [official Perl website](https://www.perl.org/get.html).

Clone the repository to your local machine using the following command:

```sh
git clone https://github.com/GururajaSR/Perl-Programming-Fundamentals.git
cd Perl-Programming-Fundamentals
```

## Usage

Run the scripts using the Perl interpreter:

```sh
perl script_name.pl
```

For example, to run the `basics.pl` script:

```sh
perl basics.pl
```

Each script is self-contained and includes comments and print statements to guide you through the code and demonstrate the concepts covered. Modify the scripts to experiment with different inputs and observe the results.

## File Descriptions

### basics.pl

This script introduces the basic concepts of Perl programming, including variables, data types, and simple operations.

### basic_syntax.pl

This script covers the basic syntax of Perl, including control structures (if statements, loops), functions, and error handling.

### data_analysis.pl

This script demonstrates how to perform basic data analysis tasks using Perl, including reading data from files, processing data, and generating basic statistics.

#### How to Run the Script

1. **Ensure Perl Modules are Installed**:
   - Install necessary Perl modules if you haven't already:
     ```sh
     cpan install Text::CSV
     cpan install GD::Graph
     ```

2. **Save the Script**:
   - Save the following code to a file named `data_analysis.pl`:
     
3. **Run the Script**:
   - To filter data:
     ```sh
     perl data_analysis_tool.pl --file data.csv --operation filter
     ```
   - To compute aggregation:
     ```sh
     perl data_analysis_tool.pl --file data.csv --operation aggregate
     ```
   - To generate a chart:
     ```sh
     perl data_analysis_tool.pl --file data.csv --operation chart
     ```

#### Additional Notes

- Ensure `data.csv` is in the correct format and located in the same directory as the script or provide the full path.
- Modify column indices in `filter_data` and `compute_mean` based on the structure of your CSV file.

### data_structures.pl

This script explores different data structures in Perl, such as arrays, hashes, and references, and how to use them effectively.

### file_handling.pl

This script shows how to handle file operations in Perl, including reading from and writing to files, and managing file permissions.

### leet_code.pl

This script contains solutions to common algorithm problems found on LeetCode, implemented in Perl.

### modules.pl

This script explains how to use Perl modules, including how to install them from CPAN, and how to create and use your own modules.

### oop.pl

This script covers the basics of Object-Oriented Programming (OOP) in Perl, including creating classes, objects, inheritance, and polymorphism.

### regex.pl

This script provides an overview of regular expressions in Perl, demonstrating how to match, extract, and manipulate text using regex.

## Contributing

Contributions are welcome! To maintain the integrity of the project, please follow these guidelines:

1. **Fork the repository** and create your branch from `main`.
2. **Create a feature branch** (`git checkout -b feature/your-feature`).
3. **Make your changes**. Ensure that your code follows the [Perl Best Practices](https://perldoc.perl.org/perlstyle.html).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
