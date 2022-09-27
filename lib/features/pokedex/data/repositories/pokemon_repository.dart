import '../models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}
