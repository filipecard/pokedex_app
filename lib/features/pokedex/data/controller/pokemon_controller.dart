import 'package:pokedex_app/features/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/pokedex/data/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/request_page_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';

class PokemonController {
  final PokemonRepositoryImpl _pokemonRepositoryImpl =
      PokemonRepositoryImpl(pokemonDataSource: PokemonDataSourceImpl());

  Future<List<SimplesPokemon>> getSimplesPokemonList(String urlList) {
    return _pokemonRepositoryImpl.getSimplePokemonList(urlList);
  }

  Future<Pokemon> getDataPokemon(String urlPokemon) {
    return _pokemonRepositoryImpl.getDataPokemon(urlPokemon);
  }

  Future<String> getNextPage(String currentPage) {
    return _pokemonRepositoryImpl.getNextPage(currentPage);
  }

  Future<String> getPreviousPage(String currentPage) {
    return _pokemonRepositoryImpl.getPreviousPage(currentPage);
  }

  Future<RequestPagePokemon> getRequestPagePokemon(String url) {
    return _pokemonRepositoryImpl.getRequestPagePokemon(url);
  }
}
