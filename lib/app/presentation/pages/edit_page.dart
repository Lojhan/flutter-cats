import 'package:example_app/app/BloC/cats/cats_bloc.dart';
import 'package:example_app/app/models/cat.dart';
import 'package:example_app/app/presentation/components/application_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditCatPage extends StatefulWidget {
  final Cat cat;

  const EditCatPage({Key? key, required this.cat}) : super(key: key);

  @override
  State<EditCatPage> createState() => _EditCatPageState();
}

class _EditCatPageState extends State<EditCatPage> {
  final CatsBloc catsBloc = Modular.get<CatsBloc>();

  final TextEditingController catNameController = TextEditingController(
    text: '',
  );
  final TextEditingController catAgeController = TextEditingController(
    text: '',
  );
  final TextEditingController catImageController = TextEditingController(
    text: '',
  );

  @override
  void initState() {
    catNameController.text = widget.cat.name;
    catAgeController.text = widget.cat.age.toString();
    catImageController.text = widget.cat.image;
    super.initState();
  }

  void addCat() {
    if (widget.cat.name.isEmpty) {
      catsBloc.add(
        AddCatEvent(
          cat: Cat(
            id: widget.cat.id,
            name: catNameController.text,
            age: int.tryParse(catAgeController.text) ?? 0,
            image: catImageController.text,
          ),
        ),
      );
    } else {
      catsBloc.add(
        EditCatEvent(
          cat: Cat(
            id: widget.cat.id,
            name: catNameController.text,
            age: int.tryParse(catAgeController.text) ?? 0,
            image: catImageController.text,
          ),
        ),
      );
    }

    Modular.to.pop();
  }

  get title {
    if (widget.cat.name.isEmpty) {
      return 'Add Cat';
    } else {
      return 'Edit Cat ${widget.cat.name}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(title: title),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              controller: catNameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: catAgeController,
              decoration: const InputDecoration(labelText: 'Age'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an age';
                }
                return null;
              },
            ),
            TextFormField(
              controller: catImageController,
              decoration: const InputDecoration(labelText: 'Image'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an image';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCat,
        child: const Icon(Icons.check),
      ),
    );
  }
}
