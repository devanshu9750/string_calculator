/// A function that takes a string of comma-separated numbers.
/// Algorithm : Split the string by the delimiter, convert each segment to an integer, and sum them up.
/// But instead of using split method, it manually iterates through the string to find delimiters and accumulate the sum.
/// This allows the function to handle any amount of numbers in the string.
int add(String numbers) {
  if (numbers.isEmpty) return 0;

  int sum = 0;
  String delimiter = ',';
  String currentNumber = '';

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == delimiter) {
      if (currentNumber.isNotEmpty) sum += int.parse(currentNumber);
      currentNumber = '';
    } else {
      currentNumber += numbers[i];
    }
  }

  if (currentNumber.isNotEmpty) sum += int.parse(currentNumber);

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
}
