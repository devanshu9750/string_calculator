/// Helper function to format negative numbers into a string.
String _getNegativeNumbersString(String negativeNumbers, int number) {
  if (negativeNumbers.isEmpty) {
    return number.toString();
  } else {
    return '$negativeNumbers,$number';
  }
}

/// A function that takes a string of comma-separated numbers.
/// Algorithm : Split the string by the delimiter, convert each segment to an integer, and sum them up.
/// But instead of using split method, it manually iterates through the string to find delimiters and accumulate the sum.
/// This allows the function to handle any amount of numbers in the string.
int add(String numbers) {
  if (numbers.isEmpty) return 0;

  int sum = 0;
  Set<String> delimiter = {',', '\n'}; // Instead of [Set] a [RegExp] can also be used
  String currentNumber = '';
  String negativeNumbers = '';

  if (numbers.startsWith('//')) {
    delimiter.add(numbers[2]); // Add custom delimiter to the [Set]
  }

  int startIndex = numbers.startsWith('//') ? 4 : 0;

  for (int i = startIndex; i < numbers.length; i++) {
    if (delimiter.contains(numbers[i])) {
      if (currentNumber.isNotEmpty) {
        int parsedNumber = int.parse(currentNumber);

        if (parsedNumber < 0) {
          negativeNumbers = _getNegativeNumbersString(negativeNumbers, parsedNumber);
        } else {
          if (parsedNumber <= 1000) sum += parsedNumber;
        }
      }
      currentNumber = '';
    } else {
      currentNumber += numbers[i];
    }
  }

  if (currentNumber.isNotEmpty) {
    int parsedNumber = int.parse(currentNumber);

    if (parsedNumber < 0) {
      negativeNumbers = _getNegativeNumbersString(negativeNumbers, parsedNumber);
    } else {
      if (parsedNumber <= 1000) sum += parsedNumber;
    }
  }

  if (negativeNumbers.isNotEmpty) {
    throw Exception('negative numbers not allowed $negativeNumbers');
  }

  return sum;
}

void main() {
  // Empty string should return 0
  print("Empty String : ${add("")}"); // Output: 0

  // Only delimiters should return 0
  print("Only Delimiters : ${add(",,,,,,")}"); // Output: 0

  // Handling numbers separated by commas
  print("Handling numbers separated by commas 1 : ${add("1,2,3")}"); // Output: 6
  print("Handling numbers separated by commas 2 : ${add("11,22,33")}"); // Output: 66

  // Handling empty segments and multiple delimiters
  print("Handling empty segments and multiple delimiters 1 : ${add(",10,20,33")}"); // Output: 63
  print("Handling empty segments and multiple delimiters 2 : ${add(",10,20,,,33")}"); // Output: 63

  // Handling large amount of numbers in the string
  print(
    "Handling large amount of numbers in the string : ${add("11,22,33,1,8,67,67,7,34,5,4,65,4,6,5,7,6,43,4,3,5,4,2,23,2,5,5,4,67,34,5,2345,4,66")}",
  ); // Output: 2973

  // Handling numbers separated by new lines
  print("Handling numbers separated by new lines : ${add("4\n8,9")}"); // Output: 21

  // Handling custom delimiter
  print("Handling custom delimiter : ${add("//=\n9=2=3")}"); // Output: 14
  print("Handling custom delimiter without numbers : ${add("//=\n")}"); // Output: 0

  // Handling negative numbers (should throw an exception)
  try {
    print("Handling negative numbers : ${add("1,-2,-3")}");
  } catch (e) {
    print(e);
  }

  // Handling negative numbers with custom delimiter
  try {
    print("Handling negative numbers with custom delimiter : ${add("//=\n-9=2=-3")}");
  } catch (e) {
    print(e);
  }

  // Handling numbers greater than 1000 (should be ignored)
  print("Handling numbers greater than 1000 : ${add("1001,2,3,1000")}"); // Output: 5
  print("Handling numbers greater than 1000 with custom delimiter : ${add("//=\n1001=2=3=1002")}"); // Output: 5
}
