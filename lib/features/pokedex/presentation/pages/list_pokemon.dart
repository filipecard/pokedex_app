import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/pokedex/presentation/styles/text_style.dart';
import '../../domain/entities/simple_pokemon.dart';
import '../styles/app_bar_title.dart';
import '../widgets/previous_next_button.dart';
import 'pokemon_info.dart';

// ignore: must_be_immutable
class ListPokemon extends StatefulWidget {
  ListPokemon({required this.baseUrl, Key? key}) : super(key: key);
  late String baseUrl;

  @override
  State<ListPokemon> createState() => ListPokemonState();
}

class ListPokemonState extends State<ListPokemon> {
  final PokemonDataSourceImpl dataSourceImpl = PokemonDataSourceImpl();
  late String nextPage;
  late String previousPage;

  late Future<List<SimplesPokemon>> futurePokemon;

  @override
  void initState() {
    futurePokemon = dataPopulation(widget.baseUrl);
    super.initState();
  }

  Future<List<SimplesPokemon>> dataPopulation(String url) async {
    nextPage = await dataSourceImpl.getNextOrPreviousPage(url, "N");
    previousPage = await dataSourceImpl.getNextOrPreviousPage(url, "P");

    return dataSourceImpl.getSimplePokemon(url);
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
          body: FutureBuilder<List<SimplesPokemon>>(
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
                            width: double.infinity,
                            height: 30,
                            color: Colors.red,
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
                        buttonNextOrPrevious(previousPage, context, "Previous"),
                        const SizedBox(width: 1),
                        buttonNextOrPrevious(nextPage, context, "Next"),
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
        ));
  }
}
