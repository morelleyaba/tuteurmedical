import '../entities/service.dart';
import '../repositories/service_repository.dart';

class GetServiceUseCase {
  final ServiceRepository repository ;

  GetServiceUseCase(this.repository);
   Future<Service> call (String? statut){
    return repository.getAllServices(statut);
   }

}