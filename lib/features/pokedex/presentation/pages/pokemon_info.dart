import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/features/pokedex/data/models/stats_pokemon.dart';
import 'package:pokedex_app/features/pokedex/data/models/type_pokemon.dart';
import 'package:pokedex_app/features/pokedex/presentation/utils/text_style.dart';
import '../../data/models/pokemon.dart';
import '../utils/app_bar_title.dart';

class PokemonInfo extends StatefulWidget {
  PokemonInfo({required this.baseUrl, Key? key}) : super(key: key);
  late String baseUrl;

  @override
  State<PokemonInfo> createState() => PokemonInfoState();
}

class PokemonInfoState extends State<PokemonInfo> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    futurePokemon = fetch();
    super.initState();
  }

  Future<Pokemon> fetch() async {
    final response = await http.get(Uri.parse(widget.baseUrl));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de pokemons');
    }

    var jsonResponseList = Pokemon.fromJson(jsonDecode(response.body));

    return jsonResponseList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle(context),
        ),
        body: Container(
          color: Colors.red[400],
          child: FutureBuilder<Pokemon>(
            future: futurePokemon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String pokeName = snapshot.data!.name;
                String pokeSprite = snapshot.data!.sprite;
                List<Widget> pokeStats = snapshot.data!.stats
                    .map(
                      (stats) => SizedBox(
                        width: 250,
                        child: ListTile(
                          leading: Text(
                            '${stats.name}:',
                            style: defaultTextStyle(
                                baseFontSize: 20, baseTextColor: Colors.red),
                          ),
                          title: Text(
                            '${stats.baseStat}',
                            style: defaultTextStyle(
                                baseFontSize: 20, baseTextColor: Colors.green),
                          ),
                        ),
                      ),
                    )
                    .toList();

                List<Widget> pokeTypes = snapshot.data!.types
                    .map(
                      (type) => Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          type.name,
                          style: defaultTextStyle(
                              baseFontSize: 20, baseTextColor: Colors.black),
                        ),
                      ),
                    )
                    .toList();

                return ListView(
                  children: [
                    Container(
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.network(
                            pokeSprite,
                            scale: 0.5,
                          ),
                          Text(
                            pokeName.toUpperCase(),
                            style: defaultTextStyle(
                                baseFontSize: 25,
                                baseTextColor: Colors.blueGrey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: pokeTypes,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.red,
                            child: Text(
                              "Status",
                              textAlign: TextAlign.center,
                              style: defaultTextStyle(baseFontSize: 25),
                            ),
                          ),
                          Column(
                            children: pokeStats,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
