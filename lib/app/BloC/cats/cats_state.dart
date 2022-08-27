part of 'cats_bloc.dart';

class CatsState extends Equatable {
  final Exception? error;
  final List<Cat> cats;
  final bool isLoading;

  const CatsState({
    this.error,
    this.cats = const [],
    this.isLoading = false,
  });

  factory CatsState.initial() => const CatsState(
        error: null,
        cats: [],
        isLoading: false,
      );

  factory CatsState.loading() => const CatsState(
        error: null,
        cats: [],
        isLoading: true,
      );

  factory CatsState.success(List<Cat> cats) => CatsState(
        error: null,
        cats: cats,
        isLoading: false,
      );

  factory CatsState.failure(Exception error) => CatsState(
        error: error,
        cats: const [],
        isLoading: false,
      );

  factory CatsState.fromJson(Map<String, dynamic> json) => CatsState(
        cats: json['cats'],
        isLoading: json['isLoading'],
        error: json['error'],
      );

  Map<String, dynamic> toJson() => {
        'cats': cats,
        'isLoading': isLoading,
        'error': error,
      };

  @override
  List<Object?> get props => [error, cats, isLoading];

  List<Cat> addCat(Cat cat) {
    List<Cat> newCats = List.from(cats);
    newCats.add(cat);
    return cats;
  }

  factory CatsState.copyWith({
    required Exception? error,
    required List<Cat> newCats,
    required bool isLoading,
  }) {
    return CatsState(
      error: error,
      cats: newCats,
      isLoading: isLoading,
    );
  }

  List<Cat> removeCat(String id) {
    List<Cat> newCats = List.from(cats);
    newCats.removeWhere((cat) => cat.id == id);
    return newCats;
  }

  List<Cat> editCat(Cat cat) {
    List<Cat> newCats = List.from(cats);
    newCats.removeWhere((cat) => cat.id == cat.id);
    newCats.add(cat);
    return newCats;
  }
}
