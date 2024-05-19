import 'dart:async';

void main() async {
  // streamWithSingleListener();
  // streamWithBroadcast();
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
