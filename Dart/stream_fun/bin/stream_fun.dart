import 'dart:async';

void main() async {
  // streamWithSingleListener();
  // streamWithBroadcast();
  streamsFromScratch();
}

streamWithSingleListener() async {
  final controller = StreamController<int>();
  controller.stream.listen((event) {
    print("listening to the stream");
    print("event: $event");
  });

  controller.add(3);
  await Future.delayed(Duration(seconds: 3));
  controller.add(10);

  // This is also another type of listener but this only prints the value
  // in the stream not listens while adding it to it so comment it to avoid potential errors

  // await for (var value in controller.stream) {
  //   print("value: $value");
  // }
}

streamWithBroadcast() async {
  final controller = StreamController<int>.broadcast();
  controller.stream.listen((event) {
    print("listening to the stream");
    print("event: $event");
  });

  controller.stream.listen((event) {
    print("listening to the stream with a second listener");
    print("event: $event");
  });

  controller.add(3);
  await Future.delayed(Duration(seconds: 3));
  controller.add(10);
}

streamsFromScratch() async {
  var stream = Stream.fromIterable([1, 3, 5, 8]);
  stream.listen((event) {
    print(event);
  });

  // or
  Stream<int> countStream(int max) async* {
    for (int i = 1; i <= max; i++) {
      yield i;
    }
  }

  var stream2 = countStream(5);

  await for (var value in stream2) {
    print(value); // Output: 1, 2, 3, 4, 5
  }
}
