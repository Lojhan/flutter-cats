import 'package:example_app/app/BloC/cats/cats_bloc.dart';
import 'package:example_app/app/presentation/pages/edit_page.dart';
import 'package:example_app/app/presentation/pages/home_page.dart';
import 'package:example_app/app/presentation/pages/login_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((inject) => CatsBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/login', child: (context, args) => const LoginPage()),
        ChildRoute(
          '/edit-cat',
          child: ((context, args) => EditCatPage(cat: args.data)),
        ),
      ];
}
