import 'dart:math';

void main(List<String> args) {
  final int evenLength = Random().nextInt(10) * 2;
  print('length : $evenLength');
  final String generatedString = generateParentheses(evenLength);
  print(generatedString);
}

String generateParentheses(int evenLength) {
  int count = evenLength ~/ 2;
  int openParenthesesCount = 0;
  int closeParenthesesCount = 0;
  String result = '';

  void openParentheses() {
    openParenthesesCount += 1;
    result += '(';
  }

  void closeParentheses() {
    closeParenthesesCount += 1;
    result += ')';
  }

  while (evenLength > 0) {
    if (openParenthesesCount == closeParenthesesCount) {
      openParentheses();
    } else if (openParenthesesCount == count) {
      closeParentheses();
    } else {
      if (Random().nextInt(2) == 0) {
        openParentheses();
      } else {
        closeParentheses();
      }
    }
    evenLength -= 1;
  }
  return result;
}
