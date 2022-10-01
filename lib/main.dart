import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokedex/constants.dart';
import 'package:pokedex_app/features/pokedex/presentation/styles/text_style.dart';
import 'features/pokedex/presentation/pages/list_pokemon.dart';
import 'features/pokedex/presentation/styles/app_bar_title.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(context),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPokemon(
                        baseUrl: pokemonBaseUrl,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Lista de Pokemons",
                  style: defaultTextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
