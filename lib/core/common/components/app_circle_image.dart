import 'package:flutter/material.dart';

class AppCircleImage extends StatelessWidget {
  final String path;
  final double size;
  final BoxFit fit;

  const AppCircleImage(
    this.path, {
    super.key,
    this.size = 50,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        path,
        width: size,
        height: size,
        fit: fit,
        errorBuilder: (context, error, stack) {
          return CircleAvatar(
            radius: size / 2,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.white),
          );
        },
      ),
    );
  }
}
