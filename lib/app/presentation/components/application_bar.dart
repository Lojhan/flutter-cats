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
    if (title != null && title!.isNotEmpty) {
      return title!;
    }

    if (path == '/') {
      return 'Home';
    }

    if (path == '/login') {
      return 'Login';
    }

    if (path == '/edit') {
      return 'Edit';
    }

    return 'Other Page';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(getTitle),
    );
  }
}
