import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc() : super(PokedexInitial()) {
    on<PokedexEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
