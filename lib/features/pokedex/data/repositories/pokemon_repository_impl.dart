import 'package:pokedex_app/features/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({required this.pokemonDataSource});

  @override
  Future<List<SimplesPokemon>> getSimplePokemonsList(String url) async {
    try {
      final model = await pokemonDataSource.getSimplePokemon(url);
      final pokemons = model.map<SimplesPokemon>((simPoke) => simPoke).toList();
      return pokemons;
    } on Exception {
      return [];
    }
  }
}
