import 'package:equatable/equatable.dart';
import 'package:example_app/app/models/cat.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends HydratedBloc<CatsEvent, CatsState> {
  CatsBloc() : super(CatsState.initial()) {
    on<AddCatEvent>(_addCat);
    on<RemoveCatEvent>(_removeCat);
    on<EditCatEvent>(_editCat);
  }

  void _addCat(
    AddCatEvent event,
    Emitter<CatsState> emit,
  ) {
    try {
      List<Cat> catsList = List.from(state.cats);
      emit(CatsState.loading());

      catsList.add(event.cat);

      emit(CatsState.copyWith(
        newCats: catsList,
        isLoading: false,
        error: null,
      ));
    } on Exception catch (e) {
      emit(CatsState.failure(e));
    }
  }

  void _removeCat(
    RemoveCatEvent event,
    Emitter<CatsState> emit,
  ) {
    try {
      CatsState oldState = state;
      emit(CatsState.loading());

      List<Cat> newCatsList =
          oldState.cats.where((cat) => cat.id != event.id).toList();
      emit(CatsState.copyWith(
        newCats: newCatsList,
        isLoading: false,
        error: null,
      ));
    } on Exception catch (e) {
      emit(CatsState.failure(e));
    }
  }

  void _editCat(
    EditCatEvent event,
    Emitter<CatsState> emit,
  ) {
    try {
      CatsState oldState = state;
      emit(CatsState.loading());

      List<Cat> newCatsList = oldState.cats.map((cat) {
        if (cat.id == event.cat.id) {
          return event.cat;
        }
        return cat;
      }).toList();
      emit(CatsState.copyWith(
        newCats: newCatsList,
        isLoading: false,
        error: null,
      ));
    } on Exception catch (e) {
      emit(CatsState.failure(e));
    }
  }

  @override
  CatsState? fromJson(Map<String, dynamic> json) {
    return CatsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CatsState state) {
    return state.toJson();
  }
}
