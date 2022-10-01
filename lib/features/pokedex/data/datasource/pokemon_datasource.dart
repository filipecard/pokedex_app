import 'dart:convert';
import 'package:pokedex_app/features/pokedex/data/utils/controller_page_pokemon.dart';
import 'package:pokedex_app/features/pokedex/domain/entities/simple_pokemon.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<List<SimplesPokemon>> getSimplePokemon(String url);
  Future<String> getNextOrPreviousPage(String url, String optionPage);
  Future<ControllerPagePokemon> getDataPagePokemon(String url);
}

class PokemonDataSourceImpl implements PokemonDataSource {
  @override
  Future<List<SimplesPokemon>> getSimplePokemon(String pokemonBaseUrl) async {
    ControllerPagePokemon resultPage = await getDataPagePokemon(pokemonBaseUrl);
    return resultPage.result;
  }

  @override
  Future<ControllerPagePokemon> getDataPagePokemon(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de pokemons');
    }

    var jsonResponseList =
        ControllerPagePokemon.fromJson(jsonDecode(response.body));

    return jsonResponseList;
  }

  @override
  Future<String> getNextOrPreviousPage(String url, String optionPage) async {
    ControllerPagePokemon dataPage = await getDataPagePokemon(url);
    if (optionPage.toUpperCase() == "N") {
      return dataPage.next;
    } else {
      return dataPage.previous;
    }
  }
}
