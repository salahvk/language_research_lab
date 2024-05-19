import 'dart:async';

Stream<List<T>> asyncMapBuffer<T>(Stream<T> stream, Duration duration) async* {
  List<T> buffer = [];

  await for (T value in stream) {
    buffer.add(value);
    await Future.delayed(duration); // Simulating asynchronous delay
    yield buffer;
    buffer = []; // Clear the buffer after yielding
  }
}

void main() async {
  final controller = StreamController<int>();

  asyncMapBuffer(controller.stream, Duration(seconds: 2)).listen((buffer) {
    print('Buffered: $buffer');
  });

  for (int i = 1; i <= 5; i++) {
    print("loop printing");
    controller.add(i);
    await Future.delayed(Duration(milliseconds: 500));
  }
  print("controller closing");

  await controller.close();
  // after the controller is closed no further events can add to the stream
}
