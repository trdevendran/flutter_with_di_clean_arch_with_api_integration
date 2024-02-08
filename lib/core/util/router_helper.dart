import 'package:flutter/material.dart';
import '../../../core/domain/entities/person.dart';
import '../../../features/person/presentation/person_detail_page.dart';
import '../../../features/person/presentation/person_list_page.dart';
import 'package:go_router/go_router.dart';

class RouterHelper {
  static GoRouter router = GoRouter(initialLocation: "/", routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const PersonListPage();
      },
    ),
    GoRoute(
        name: "details",
        path: "/details",
        builder: (BuildContext context, GoRouterState state) {
          var person = state.extra as Person;
          return PersonDetailPage(person: person);
        })
  ]);
}
