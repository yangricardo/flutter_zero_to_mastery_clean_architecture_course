import 'dart:io';

void main() {
  print('Input a number');
  int? number = int.tryParse(stdin.readLineSync() ?? '');
  print("The number is $number");
}
