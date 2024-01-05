int sumOfDigits(int start, int end) {
  int count = 0;
  for (int i = start; i <= end; i++) {
    int num = i;
    int temp = i;
    int sum = 0;
    while (num != 0) {
      int t = num % 10;
      sum =(sum* 10)+ t;
      num = num ~/ 10;
    }
    if (sum == temp) {
      count++;
    }
  }
  return count;
}
