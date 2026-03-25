import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Bienvenue Morelle",
                  style: TextTheme.of(context).titleMedium,
                ),
                automaticallyImplyLeading: false,
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(Icons.notifications_active_outlined),
                  )
                ],
              );
  }
}