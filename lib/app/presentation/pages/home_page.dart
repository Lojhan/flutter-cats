import 'package:example_app/app/BloC/cats/cats_bloc.dart';
import 'package:example_app/app/models/cat.dart';
import 'package:example_app/app/presentation/components/application_bar.dart';
import 'package:example_app/app/presentation/components/cats_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget addCatButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Modular.to.pushNamed('/edit-cat', arguments: Cat.initial());
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Cat'),
    );
  }

  @override
  Widget build(BuildContext context) {
    CatsBloc catsBloc = Modular.get<CatsBloc>();

    return BlocBuilder(
      bloc: catsBloc,
      builder: (BuildContext context, CatsState state) {
        if (state.isLoading) {
          return Scaffold(
            appBar: const ApplicationBar(),
            body: const Center(child: CircularProgressIndicator()),
            floatingActionButton: addCatButton(context),
          );
        }

        if (state.error is Exception) {
          return Scaffold(
            appBar: const ApplicationBar(),
            body: const Center(child: Text('Something went wrong')),
            floatingActionButton: addCatButton(context),
          );
        }

        if (state.cats.isNotEmpty) {
          return Scaffold(
            appBar: const ApplicationBar(),
            body: Center(child: CatsList(cats: state.cats)),
            floatingActionButton: addCatButton(context),
          );
        }

        if (state.cats.isEmpty) {
          return Scaffold(
            appBar: const ApplicationBar(),
            body: const Center(child: Text('No cats found')),
            floatingActionButton: addCatButton(context),
          );
        }

        return Scaffold(
          appBar: const ApplicationBar(),
          body: const Center(child: Text('No cats found')),
          floatingActionButton: addCatButton(context),
        );
      },
    );
  }
}
