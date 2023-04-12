import 'dart:io';

int getRecursiveFactorial(int number) {
  if (number < 0)
    return -1;
  else if (number == 0) return 1;
  return (number * getRecursiveFactorial(number - 1));
}

int getWhileFactorial(int number) {
  late int factorialNumber = number;
  late int nextFactorialNumber = number;
  if (number == 0 || number == 1)
    factorialNumber = 1;
  else if (number < 0)
    factorialNumber = -1;
  else {
    while (nextFactorialNumber > 1) {
      nextFactorialNumber--;
      factorialNumber = factorialNumber * nextFactorialNumber;
    }
  }
  return factorialNumber;
}

int getForLoopFactorial(int number) {
  late int factorialNumber = number;
  if (number == 0 || number == 1)
    factorialNumber = 1;
  else if (number < 0)
    factorialNumber = -1;
  else {
    for (int nextFactorialNumber = number - 1;
        nextFactorialNumber >= 1;
        nextFactorialNumber--) {
      factorialNumber = factorialNumber * nextFactorialNumber;
    }
  }
  return factorialNumber;
}

void main() {
  print('Input a number to be factorized');
  int? number = int.tryParse(stdin.readLineSync() ?? '');
  if (number != null) {
    int factorialNumber = getForLoopFactorial(number);
    print("The factiorial number for $number is $factorialNumber");
  } else {
    print("Not possible to calculate the factorial");
  }
}
