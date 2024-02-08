import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/router_helper.dart';
import '../../../features/person/domain/person_bloc.dart';
import '../../../injections/dependencies.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

/// This widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Add all the possible Blocs here
          BlocProvider<PersonBloc>(
            create: (context) => sl<PersonBloc>(),
          )
        ],
        child: MaterialApp.router(
          title: 'Flutter Exam',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: RouterHelper.router,
        ));
  }
}
