import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final String path;
  final double size;
  final Color? color;

  const AppIcon(
    this.path, {
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color,
      );
    }

    return Image.asset(
      path,
      width: size,
      height: size,
      color: color,
      errorBuilder: (context, error, stack) {
        return Icon(Icons.broken_image, size: size, color: color ?? Colors.grey);
      },
    );
  }
}
