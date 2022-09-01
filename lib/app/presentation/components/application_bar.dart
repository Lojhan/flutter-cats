import 'package:example_app/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const ApplicationBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  get preferredSize => const Size.fromHeight(kToolbarHeight);

  String get getTitle {
    String path = Modular.to.path;
    return title ?? routesMap[path]?.keys.first ?? 'App';
  }

  List<Widget> actions() {
    if (Modular.to.path != '/') return [];
    return [
      PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: '/about',
            child: Text('About'),
          ),
          const PopupMenuItem(
            value: '/donate',
            child: Text('Donate'),
          ),
          const PopupMenuItem(
            value: '/settings',
            child: Text('Settings'),
          )
        ],
        onSelected: (String value) => Modular.to.pushNamed(value),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions(),
      title: Text(getTitle),
    );
  }
}
