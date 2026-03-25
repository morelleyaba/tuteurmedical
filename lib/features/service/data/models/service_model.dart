import 'package:flutter/material.dart';

import '../../domain/entities/service.dart';

class ServiceModel extends Service{

  ServiceModel({
    required int id,
    required String name,
    required IconData icon,
    required String statut,
     bool  selected = false,
  }) :super(id: id, name: name, icon: icon, statut: statut, selected: selected ); // parce que on ne les a pas declaré en haut

factory ServiceModel.fromJson(Map<String, dynamic> json) {
  return ServiceModel(
      id: json['id'],
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      statut: json['statut'],
  );
}

Map<String, dynamic> toJson(){
return    
{ 'id':id,
  'name':name,
  'icon':icon,
  'statut':statut,
  };
}
}

// Models / DTO : convertissent les données vers / depuis l'exterieur
// UI / Widget : utilsent les entities ou les objets créées par les use cases