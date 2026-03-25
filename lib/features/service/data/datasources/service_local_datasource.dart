import 'package:flutter/material.dart';

import '../models/service_model.dart';

class ServiceLocalDatasource {
  
 List<ServiceModel> servicesList(){
  return [
    ServiceModel.fromJson({
      "id": 1,
      "name": "Sage femme",
      "icon": Icons.medication_liquid_sharp,
      "statut": "Dermato",
      "selected": false,
    }),
    ServiceModel.fromJson({
      "id": 2,
      "name": "Dermato",
      "icon": Icons.medication_liquid_sharp,
      "statut": "Dermato",
      "selected": false,
    }),
    ServiceModel.fromJson({
      "id": 3,
      "name": "Cardio",
      "icon": Icons.medication_liquid_sharp,
      "statut": "Dermato",
      "selected": false,
    }),
    ServiceModel.fromJson({
      "id": 4,
      "name": "Dentiste",
      "icon": Icons.medication_liquid_sharp,
      "statut": "Dermato",
      "selected": false,
    }),
    ServiceModel.fromJson({
      "id": 5,
      "name": "Churigie",
      "icon": Icons.medication_liquid_sharp,
      "statut": "Dermato",
      "selected": false,
    }),
  ];
 }
}
// les fausses données appelé aussi "mock data" en attendant de consommer les vrai données
// c'est le repository_impl qui decide d'utiliser le fake ou l'API
// l'avantage énorme du localDatasource : une fois l'API est pret , on
// remplace juste ServiceLocalDataSource par ServiceDatasource