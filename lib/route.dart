import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_ui/person_details.dart';
import 'package:task_ui/persons_grid.dart';
import 'package:task_ui/search.dart';


final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/persons',
      pageBuilder: (context, state) => const MaterialPage(child: PersonsView()),
    ),
    GoRoute(
      path: '/persons/person_details',
      pageBuilder: (context, state) => const MaterialPage(child: PersonDetails()),
    ),


  ],
);