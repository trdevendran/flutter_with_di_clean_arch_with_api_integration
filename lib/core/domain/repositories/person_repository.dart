import '../entities/person.dart';

/// Repository contains an abstract methods for all the repository based
/// operations for Person module
abstract class PersonRepository {
  Future<List<Person>> getPersonList(int quantity);
}
