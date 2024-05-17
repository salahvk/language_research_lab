import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Scaffold(
      body: Center(
        child: VoucherCustomContainer(
          height: 90,
          width: 350,
          borderColor: Colors.black,
          innerColor: Colors.white,
        ),
      ),
    ));
  }
}

class VoucherCustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color borderColor;
  final Color innerColor;
  const VoucherCustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.innerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
        ),
        Positioned(
            left: 90,
            top: -20,
            child: Container(
              width: 50.0,
              height: 40.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: innerColor,
                  border: Border.all(color: borderColor) // Make it circular
                  ),
            )),
        Positioned(
            left: 90,
            bottom: -20,
            child: Container(
              width: 50.0,
              height: 40.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: innerColor,
                  border: Border.all(color: borderColor) // Make it circular
                  ),
            )),
        Positioned(
          left: 113,
          top: 20,
          width: 2,
          child: Container(
            color: borderColor,
            height: 50,
          ),
        )
      ],
    );
  }
}
