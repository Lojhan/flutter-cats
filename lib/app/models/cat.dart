import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String name;
  final int age;
  final String image;

  const Cat({
    required this.id,
    required this.name,
    required this.age,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, age, image];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'image': image,
      };

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        image: json['image'],
      );

  factory Cat.initial() => Cat(
        id: DateTime.now().toString(),
        name: '',
        age: 3,
        image: 'https://placekitten.com/200/300',
      );
}
