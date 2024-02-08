import 'package:get_it/get_it.dart';
import '../../../core/domain/repositories/person_repository.dart';
import '../../../features/person/domain/person_bloc.dart';
import '../core/domain/usecases/person_use_cases.dart';
import '../features/person/data/person_repository_impl.dart';

final sl = GetIt.asNewInstance();

/// It's a place to configure all the instances that are maintain by DI
/// to avoid boiler plate codes
void setupDependencies() {
  // Register all the possible Blocs
  sl.registerFactory(() => PersonBloc(sl()));

  // Register all the possible UseCases
  sl.registerLazySingleton(() => PersonUseCases(sl()));

  // Register all the possible Repositories
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl());
}
