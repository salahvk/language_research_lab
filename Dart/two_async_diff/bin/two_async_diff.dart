void main(List<String> arguments) async {
  print(await printANumber());
  await for (int value in streamNumbers()) {
    print(value);
  }
}

Future<int> printANumber() async {
  print("Entered to async function");
  await Future.delayed(Duration(seconds: 2));
  return 2;
}

Stream<int> streamNumbers() async* {
  print("Entered to async* function");
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
