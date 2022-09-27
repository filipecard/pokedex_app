import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../data/controller/controller_page_pokemon.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({Key? key}) : super(key: key);
  @override
  State<ListPokemon> createState() => ListPokemonState();
}

class ListPokemonState extends State<ListPokemon> {
  late Future<List<SimplesPokemon>> futurePokemon;

  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  @override
  void initState() {
    futurePokemon = fetch();
    super.initState();
  }

  Future<List<SimplesPokemon>> fetch() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de pokemons');
    }

    var jsonResponseList =
        ControllerPagePokemon.fromJson(jsonDecode(response.body));
    return jsonResponseList.result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pokedex'),
          ),
          body: Center(
            child: FutureBuilder<List<SimplesPokemon>>(
              future: futurePokemon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Widget> listSimplesPokemon = snapshot.data!
                      .map((e) => ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.url),
                          ))
                      .toList();

                  return ListView(
                    children: [
                      Column(children: listSimplesPokemon),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              child: const Text("Preview"),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              child: const Text("Next"),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
