import 'package:example_app/app/BloC/cats/cats_bloc.dart';
import 'package:example_app/app/BloC/themes/themes_bloc.dart';
import 'package:example_app/app/presentation/pages/about_page.dart';
import 'package:example_app/app/presentation/pages/donate_page.dart';
import 'package:example_app/app/presentation/pages/edit_page.dart';
import 'package:example_app/app/presentation/pages/home_page.dart';
import 'package:example_app/app/presentation/pages/login_page.dart';
import 'package:example_app/app/presentation/pages/settings_page.dart';
import 'package:example_app/app/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

Map<String, Map<String, Widget Function(BuildContext, dynamic)>> routesMap = {
  '/': {
    'Home Page': (context, args) => const HomePage(),
  },
  '/login': {
    'Login Page': (context, args) => const LoginPage(),
  },
  '/register': {
    'Sign Up Page': (context, args) => const SignUpPage(),
  },
  '/about': {
    'About Page': (context, args) => const AboutPage(),
  },
  '/settings': {
    'Settings Page': (context, args) => const SettingsPage(),
  },
  '/edit-cat': {
    'Add Cat Page': (context, args) => EditCatPage(cat: args.data),
  },
  '/donate': {
    'Donate Page': (context, args) => const DonatePage(),
  },
};

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((inject) => CatsBloc()),
        Bind.singleton((inject) => ThemesBloc())
      ];

  @override
  List<ModularRoute> get routes => routesMap.keys
      .map(
        (key) => ChildRoute(key, child: routesMap[key]!.entries.first.value),
      )
      .toList();
}
