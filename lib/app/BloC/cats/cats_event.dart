part of 'cats_bloc.dart';

abstract class CatsEvent extends Equatable {
  const CatsEvent();
}

class AddCatEvent extends CatsEvent {
  final Cat cat;
  const AddCatEvent({
    required this.cat,
  });

  @override
  List<Object?> get props => [cat];
}

class RemoveCatEvent extends CatsEvent {
  final String id;
  const RemoveCatEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class EditCatEvent extends CatsEvent {
  final Cat cat;
  const EditCatEvent({
    required this.cat,
  });

  @override
  List<Object?> get props => [cat];
}
