// Service entity
import 'package:flutter/material.dart';

class Service {
  final int id;
  final String name;
  final IconData icon;
  final String statut;
  final bool selected ;

  Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.statut,
     this.selected = false
  });
}
// suivant repository (interface)
// les entities : jamais de flutter, jamais de JSON