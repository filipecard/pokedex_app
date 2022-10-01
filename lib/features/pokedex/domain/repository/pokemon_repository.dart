import '../entities/simple_pokemon.dart';

abstract class PokemonRepository {
  Future<List<SimplesPokemon>> getSimplePokemonsList(String url);
}
