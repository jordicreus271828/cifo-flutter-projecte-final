import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const CustomErrorWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    debugPrint("Error: ${snapshot.error}");
    return const Row(
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text("Error"),
      ],
    );
  }
}
