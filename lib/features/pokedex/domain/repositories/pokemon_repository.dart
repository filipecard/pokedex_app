import 'package:pokedex_app/features/pokedex/data/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/request_page_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';

abstract class PokemonRepository {
  Future<List<SimplesPokemon>> getSimplePokemonList(String url);

  Future<Pokemon> getDataPokemon(String url);

  Future<String> getNextPage(String currentPage);

  Future<String> getPreviousPage(String currentPage);

  Future<RequestPagePokemon> getRequestPagePokemon(String url);
}
