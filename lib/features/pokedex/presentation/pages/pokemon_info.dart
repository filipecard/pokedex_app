import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/features/pokedex/constants.dart';
import 'package:pokedex_app/features/pokedex/data/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/pokedex/presentation/styles/text_style.dart';
import '../../data/models/pokemon.dart';
import '../styles/app_bar_title.dart';

// ignore: must_be_immutable
class PokemonInfo extends StatefulWidget {
  PokemonInfo({required this.baseUrl, Key? key}) : super(key: key);
  late String baseUrl;

  @override
  State<PokemonInfo> createState() => PokemonInfoState();
}

class PokemonInfoState extends State<PokemonInfo> {
  late Future<Pokemon> futurePokemon;
  final PokemonDataSourceImpl dataSourceImpl = PokemonDataSourceImpl();

  @override
  void initState() {
    futurePokemon = dataSourceImpl.getDataPokemon(widget.baseUrl);
    super.initState();
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
          color: red700,
          child: FutureBuilder<Pokemon>(
            future: futurePokemon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String pokeName = snapshot.data!.name;
                String pokeSprite = snapshot.data!.sprite;

                List<Widget> pokeTypes = snapshot.data!.types
                    .map(
                      (type) => Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          type.name.toUpperCase(),
                          style: defaultTextStyle(
                              baseFontSize: 20, baseTextColor: Colors.blueGrey),
                        ),
                      ),
                    )
                    .toList();

                List<Widget> pokeStats = snapshot.data!.stats
                    .map(
                      (stats) => SizedBox(
                        width: 250,
                        child: ListTile(
                          leading: Text(
                            '${stats.name.toUpperCase()}:',
                            style: defaultTextStyle(
                                baseFontSize: 20,
                                baseTextColor: Colors.blueGrey),
                          ),
                          title: Text(
                            '${stats.baseStat}',
                            style: defaultTextStyle(
                                baseFontSize: 20,
                                baseTextColor: Colors.lightGreen),
                          ),
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
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Colors.blueGrey,
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
