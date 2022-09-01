import 'package:example_app/app/BloC/themes/themes_bloc.dart';
import 'package:example_app/app/presentation/components/application_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemesBloc themesBloc = Modular.get<ThemesBloc>();

    return BlocBuilder(
        bloc: themesBloc,
        builder: (BuildContext context, ThemesState state) {
          return Scaffold(
              appBar: const ApplicationBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(12),
                      child: ListTile(
                        title: const Text('Theme'),
                        subtitle: Text('Selected: ${state.theme}'),
                        trailing: Switch(
                          value: state.theme == 'dark',
                          onChanged: (value) {
                            themesBloc.add(
                              ChangeThemeEvent(
                                theme: value ? 'dark' : 'light',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
