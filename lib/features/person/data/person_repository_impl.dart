import '../../../core/constants/api_keys.dart';
import '../../../core/domain/entities/person.dart';
import '../../../core/domain/entities/person_list_response.dart';
import '../../../core/domain/repositories/person_repository.dart';
import '../../../core/network/rest_client.dart';

/// This class has the implementation of all the abstracted functions of Person module
/// to extract the data from the Data layer
class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<List<Person>> getPersonList(int quantity) async {
    final restClient =
        await RestClient<PersonListResponse>(baseUrl: ApiKeys.baseURL).get(
            "${ApiKeys.endPointPersonList}?_quantity=$quantity",
            (json) => PersonListResponse.fromJson(json));
    return restClient.data ?? [];
  }
}
