import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokedex/presentation/utils/text_style.dart';

import 'features/pokedex/presentation/pages/list_pokemon.dart';
import 'features/pokedex/presentation/utils/app_bar_title.dart';

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
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(context),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white24,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPokemon(
                        baseUrl: _baseUrl,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Lista pokemon",
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
