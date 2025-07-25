# String Calculator

A simple String Calculator implementation using Dart

## Objective

The goal of this project is to build a calculator that can take a string of numbers with various delimiters and return their sum.

---

## Features

- Returns `0` for an empty string
- Accepts a single number and returns it as an integer
- Accepts two or more numbers separated by commas and returns their sum
- Handles newline (`\n`) as a delimiter along with commas
- Supports custom delimiters specified in the format `//[delimiter]\n[numbers]`
- Considers two continous commas (,,) as 0
- Throws an error when negative numbers are passed
- Numbers greater than 1000 are ignored
- Handles delimeters with length greater than 1

---

## Usage

```bash
git clone git@github.com:devanshu9750/string_calculator.git
cd string_calculator

dart main.dart
