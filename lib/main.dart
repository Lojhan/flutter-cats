import 'dart:io';

import 'package:example_app/app/app_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = kIsWeb
      ? HydratedStorage.webStorageDirectory
      : await getApplicationDocumentsDirectory();

  final storage = await HydratedStorage.build(
    storageDirectory: dir,
  );

  HydratedBlocOverrides.runZoned(
    storage: storage,
    () => runApp(ModularApp(
      module: AppModule(),
      child: const MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login');
    return MaterialApp.router(
      title: 'Prediction App',
      theme: ThemeData.dark(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
