import '../entities/service.dart';

abstract class ServiceRepository {
  // Defini ce qu'on peut faire avec les services

  Future<Service> getService(int id);
  Future<Service> getAllServices(String? statut);
}
// suivant Use Case - la logique metier