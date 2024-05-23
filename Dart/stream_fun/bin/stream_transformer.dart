void main() async {
  var stream = Stream.fromIterable([3, 5, 7, 9, 3]);
  var transformedStream = stream.map((event) => event * 2);

  await for (var value in transformedStream) {
    print(value);
  }
}
