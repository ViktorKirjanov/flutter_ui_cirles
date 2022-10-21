import 'package:flutter/material.dart';

class HelperBorder extends StatelessWidget {
  final double size;

  const HelperBorder({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.red,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
