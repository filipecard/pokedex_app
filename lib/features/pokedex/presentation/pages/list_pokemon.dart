import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/features/pokedex/presentation/utils/text_style.dart';
import '../../data/controller/controller_page_pokemon.dart';
import '../utils/app_bar_title.dart';
import 'pokemon_info.dart';

class ListPokemon extends StatefulWidget {
  ListPokemon({required this.baseUrl, Key? key}) : super(key: key);
  late String baseUrl;

  @override
  State<ListPokemon> createState() => ListPokemonState();
}

class ListPokemonState extends State<ListPokemon> {
  late Future<List<SimplesPokemon>> futurePokemon;
  late String nextPage;
  late String previousPage;

  @override
  void initState() {
    futurePokemon = fetch();
    super.initState();
  }

  Future<List<SimplesPokemon>> fetch() async {
    final response = await http.get(Uri.parse(widget.baseUrl));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de pokemons');
    }

    var jsonResponseList =
        ControllerPagePokemon.fromJson(jsonDecode(response.body));
    nextPage = jsonResponseList.next;
    previousPage = jsonResponseList.previous;
    return jsonResponseList.result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        child: Scaffold(
          appBar: AppBar(
            title: appBarTitle(context),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            color: Colors.red[400],
            child: FutureBuilder<List<SimplesPokemon>>(
              future: futurePokemon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Widget> listSimplesPokemon = snapshot.data!
                      .map(
                        (pokemon) => Container(
                          padding: const EdgeInsets.all(5),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PokemonInfo(
                                    baseUrl: pokemon.url,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 400,
                              height: 30,
                              color: Colors.white12,
                              child: Text(
                                pokemon.name,
                                style: defaultTextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ) // subtitle: Text(e.url)
                      .toList();
                  return ListView(
                    children: [
                      Column(children: listSimplesPokemon),
                      Row(
                        children: [
                          buttonNextOrBack(previousPage, context, "Previous"),
                          const SizedBox(width: 1),
                          buttonNextOrBack(nextPage, context, "Next"),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              },
            ),
          ),
        ));
  }
}

Visibility buttonNextOrBack(String url, BuildContext context, String name) {
  return Visibility(
    visible: url != 'null',
    child: Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red[700],
          boxShadow: const [
            BoxShadow(offset: Offset(3, 1), color: Colors.black)
          ],
        ),
        child: TextButton(
          child: Text(
            name,
            style: defaultTextStyle(),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListPokemon(
                  baseUrl: url,
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
