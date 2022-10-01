import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/repository/pokemon_repository.dart';

class GetSimplePokemonList {
  final PokemonRepository repository;

  GetSimplePokemonList(this.repository);

  Future<List<SimplesPokemon>> call(String url) async {
    return repository.getSimplePokemonsList(url);
  }
}
