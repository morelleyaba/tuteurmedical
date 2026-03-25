import '../entities/service.dart';

abstract class ServiceRepository {
  // Defini ce qu'on peut faire avec les services

  // Future<Service> getService(int id);
  // get liste de services / "getAllServices" sera utilisé dans ServiceRepositoryImpl
  Future<List<Service>> getAllServices(String? statut);
}
// suivant Use Case - la logique metier