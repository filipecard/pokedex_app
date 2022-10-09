import 'dart:convert';
import 'package:pokedex_app/features/pokedex/data/models/pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/request_page_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<List<SimplesPokemon>> getSimplePokemon(String url);
  Future<Pokemon> getDataPokemon(String url);
  Future<String> getNextPage(String currentPage);
  Future<String> getPreviousPage(String currentPage);
  Future<RequestPagePokemon> getRequestPagePokemon(String url);
}

class PokemonDataSourceImpl implements PokemonDataSource {
  @override
  Future<List<SimplesPokemon>> getSimplePokemon(String pokemonBaseUrl) async {
    RequestPagePokemon resultPage = await getRequestPagePokemon(pokemonBaseUrl);
    return resultPage.result;
  }

  @override
  Future<RequestPagePokemon> getRequestPagePokemon(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de pokemons');
    }

    var jsonResponseList =
        RequestPagePokemon.fromJson(jsonDecode(response.body));

    return jsonResponseList;
  }

  @override
  Future<String> getNextPage(String currentPage) async {
    RequestPagePokemon dataPage = await getRequestPagePokemon(currentPage);
    return dataPage.next;
  }

  @override
  Future<String> getPreviousPage(String currentPage) async {
    RequestPagePokemon dataPage = await getRequestPagePokemon(currentPage);
    return dataPage.previous;
  }

  @override
  Future<Pokemon> getDataPokemon(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar as informações do pokemon');
    }

    var jsonResponse = Pokemon.fromJson(jsonDecode(response.body));
    return jsonResponse;
  }
}
