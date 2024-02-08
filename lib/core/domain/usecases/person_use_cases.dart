import '../../../core/domain/repositories/person_repository.dart';

import '../entities/person.dart';

/// Contains all the use cases of the Person module as a domain layer
class PersonUseCases {
  final PersonRepository repository;

  PersonUseCases(this.repository);

  Future<List<Person>> getPersonList(int quantity) =>
      repository.getPersonList(quantity);
}
