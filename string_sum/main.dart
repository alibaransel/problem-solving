import 'dart:math';

void main() {
  String result = sum(pow(2, 62).toString(), pow(2, 60).toString());
  print(result);
}

String sum(String val1, String val2) {
  final int length1 = val1.length;
  final int length2 = val2.length;
  late final int length;
  String result = "";
  int? digit1;
  int? digit2;
  int digitSum = 0;
  bool hasExtra = false;

  if (length1 > length2) {
    val2 = "0" * (length1 - length2) + val2;
    length = length1;
  } else {
    val1 = "0" * (length2 - length1) + val1;
    length = length2;
  }

  result = "0" * length;

  for (int i = length - 1; i > -1; i--) {
    digit1 = int.tryParse(val1[i]);
    digit2 = int.tryParse(val2[i]);
    if (digit1 == null || digit2 == null) return "error";
    digitSum = digit1 + digit2;
    if (hasExtra) {
      digitSum++;
      hasExtra = false;
    }
    if (digitSum < 10) {
      result = changeChar(result, i, digitSum.toString());
    } else {
      hasExtra = true;
      result = changeChar(result, i, (digitSum - 10).toString());
    }
  }

  if (hasExtra) {
    result = "1" + result;
  } else {
    while (result.isNotEmpty && result[0] == "0") {
      result = result.substring(1);
    }
    if (result.isEmpty) {
      result = "0";
    }
  }

  return result;
}

String changeChar(String string, int index, String char) {
  return string.substring(0, index) + char + string.substring(index + 1, string.length);
}
