import 'package:example_app/app/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CatsList extends StatelessWidget {
  final List<Cat> cats;

  const CatsList({
    Key? key,
    required this.cats,
  }) : super(key: key);

  void editCat(Cat cat) {
    Modular.to.pushNamed('/edit-cat', arguments: cat);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.all(12),
          child: ListTile(
            onTap: () => editCat(cats[index]),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(cats[index].image),
            ),
            title: Text(cats[index].name),
            subtitle: Text('Age: ${cats[index].age}'),
          ),
        );
      },
    );
  }
}
