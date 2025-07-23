// This Dart code defines a function that takes a string of comma-separated numbers,
int add(String numbers) {
  if (numbers.isEmpty) return 0;

  List<String> numberList = numbers.split(',');
  int sum = numberList.fold(0, (previousValue, element) => previousValue + int.parse(element));

  return sum;
}

void main() {
  print(add("")); // Output: 0
  print(add("1,2,3")); // Output: 6
  print(add("11,22,33")); // Output: 66
}
