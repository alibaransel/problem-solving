IntMatrix input1 = [
  [1, 0, 0, 0, 0, 0],
  [0, 1, 0, 1, 1, 1],
  [0, 0, 1, 0, 1, 0],
  [1, 1, 0, 0, 1, 0],
  [1, 0, 1, 1, 0, 0],
  [1, 0, 0, 0, 0, 1],
];

typedef IntMatrix = List<List<int>>;
typedef MatrixPoint = List<int>;

void main(List<String> args) {
  removeIslands(input1);
}

void removeIslands(IntMatrix inputMatrix) {
  final yLength = inputMatrix.length;
  final xLength = inputMatrix[0].length;

  List<MatrixPoint> discoveryList = [];

  IntMatrix connectedMatrix = List.generate(
    inputMatrix.length,
    (index) => List.generate(
      inputMatrix[0].length,
      (index) => 0,
    ),
  );

  for (int i = 0; i < xLength; i++) {
    if (inputMatrix[0][i] == 1) {
      discoveryList.add([0, i]);
    }
    if (inputMatrix[yLength - 1][i] == 1) {
      discoveryList.add([yLength - 1, i]);
    }
  }

  for (int i = 1; i < yLength - 1; i++) {
    final int first = inputMatrix[i][0];
    final int last = inputMatrix[i][xLength - 1];

    if (first == 1) discoveryList.add([i, 0]);
    if (last == 1) discoveryList.add([i, xLength - 1]);
  }

  while (discoveryList.isNotEmpty) {
    final MatrixPoint point = discoveryList[0];
    final int y = point[0];
    final int x = point[1];

    discoveryList.removeAt(0);
    () {
      if (y < 0 || y > yLength - 1) return;
      if (x < 0 || x > xLength - 1) return;
      if (inputMatrix[y][x] == 0) return;
      if (connectedMatrix[y][x] == 1) return;
      connectedMatrix[y][x] = 1;
      discoveryList.addAll([
        [y + 1, x],
        [y - 1, x],
        [y, x + 1],
        [y, x - 1],
      ]);
    }();
    int a = 0;
    connectedMatrix.forEach((list) {
      list.forEach((value) {
        a += value;
      });
    });
    print(a);
  }

  print("---");
  for (int i = 0; i < yLength; i++) {
    print(inputMatrix[i].toString() + " => " + connectedMatrix[i].toString());
  }
}
