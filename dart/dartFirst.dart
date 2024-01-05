import 'dart:io';
import 'dartSecond.dart';

void main() {
  print('Enter start Range');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Enter end Range');
  int num2 = int.parse(stdin.readLineSync()!);
  int count = sumOfDigits(num1,num2 );
  print(count);
}
