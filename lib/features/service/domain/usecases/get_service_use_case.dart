import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetAllServiceUseCase {
  final ServiceRepository repository ;

  GetAllServiceUseCase(this.repository);
   Future<List<Service>> call (String? statut) {
    return  repository.getAllServices(statut);
   }

}

// les use case : utilisent les entities