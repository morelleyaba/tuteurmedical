import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? align;
  final int? maxLines;

  const AppText(
    this.text, {
    super.key,
    required this.style,
    this.align,
    this.maxLines,
  });

  // ====== STYLES PRÉ-DÉFINIS ======

  factory AppText.title(String text) => AppText(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      );

  factory AppText.subtitle(String text) => AppText(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      );

  factory AppText.body(String text) => AppText(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );

  factory AppText.small(String text) => AppText(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}

// How using it :
// Title : AppText.title("Connexion")

// SubTitle : AppText.subtitle("Entrez votre email pour continuer")

// Normal text : 
// AppText.body("Bienvenue dans votre tuteur médical")
