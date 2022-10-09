import 'package:pokedex_app/features/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/pokedex/data/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/request_page_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({required this.pokemonDataSource});

  @override
  Future<List<SimplesPokemon>> getSimplePokemonList(String url) async {
    try {
      final model = await pokemonDataSource.getSimplePokemon(url);
      final simplePokemons =
          model.map<SimplesPokemon>((simPoke) => simPoke).toList();
      return simplePokemons;
    } on Exception {
      return [];
    }
  }

  @override
  Future<Pokemon> getDataPokemon(String urlPokemon) async {
    try {
      final pokemon = await pokemonDataSource.getDataPokemon(urlPokemon);
      return pokemon;
    } on Exception {
      return Pokemon(
          id: 0, name: "name", sprite: "sprite", stats: [], types: []);
    }
  }

  @override
  Future<String> getNextPage(String currentPage) async {
    try {
      final nextPage = await pokemonDataSource.getNextPage(currentPage);
      return nextPage;
    } on Exception {
      return "";
    }
  }

  @override
  Future<String> getPreviousPage(String currentPage) async {
    try {
      final previousPage = await pokemonDataSource.getPreviousPage(currentPage);
      return previousPage;
    } on Exception {
      return "";
    }
  }

  @override
  Future<RequestPagePokemon> getRequestPagePokemon(String url) async {
    try {
      final requestPagePokemon =
          await pokemonDataSource.getRequestPagePokemon(url);
      return requestPagePokemon;
    } on Exception {
      return RequestPagePokemon(count: 0, next: "", previous: "", result: []);
    }
  }
}
