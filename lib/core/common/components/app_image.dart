import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double radius;

   AppImage(
    this.path,
    {super.key, 
    this.fit = BoxFit.contain,
    this.height,
    this.radius = 0,
    this.width
   });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stack) {
          return const Icon(Icons.broken_image, size: 24, color: Colors.grey);
        },
      ),
    );
  }
}