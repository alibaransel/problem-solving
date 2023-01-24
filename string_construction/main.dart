void main() {
  final Stopwatch stopwatch = Stopwatch();
  for (int i = 0; i < testCases.length; i++) {
    stopwatch.start();
    final result = countConstruct(testCases[i][0], testCases[i][1]);
    stopwatch.stop();
    print(
      "Test Case $i: ${result == testCases[i][3] ? "Passed" : "Failed"} in ${stopwatch.elapsed}",
    );
    stopwatch.reset();
  }
}

/*
bool canConstruct(String target, List<String> wordBank) {
  Map<String, bool> memory = {};

  bool tryConstruct(String target, List<String> wordBank) {
    if (memory.containsKey(target)) return memory[target]!;
    if (target == "") return true;
    for (String word in wordBank) {
      if (target.startsWith(word)) {
        if (tryConstruct(target.substring(word.length), wordBank)) {
          memory[target] = true;
          return true;
        }
      }
    }
    memory[target] = false;
    return false;
  }

  return tryConstruct(target, wordBank);
}
*/

int countConstruct(String target, List<String> wordBank) {
  Map<String, int> memory = {};

  int countWays(String target, List<String> wordBank) {
    if (memory.containsKey(target)) return memory[target]!;
    if (target == "") return 1;

    int count = 0;

    for (String word in wordBank) {
      if (target.startsWith(word)) {
        final int result = countWays(target.substring(word.length), wordBank);
        count += result;
        memory[target] = result;
      }
    }

    return count;
  }

  return countWays(target, wordBank);
}

const List testCases = [
  [
    "purple",
    ["purp", "p", "ur", "le", "purpl"],
    true,
    2,
  ],
  [
    "abcdef",
    ["ab", "abc", "cd", "def", "abcd"],
    true,
    1,
  ],
  [
    "skateboard",
    ["bo", "rd", "ate", "t", "ska", "sk", "boar"],
    false,
    0,
  ],
  [
    "enterapotentpot",
    ["a", "p", "ent", "enter", "ot", "o", "t"],
    true,
    4,
  ],
  [
    "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef",
    ["e", "ee", "eee", "eeee", "eeeee", "eeeeee", "boar"],
    false,
    0,
  ],
];
