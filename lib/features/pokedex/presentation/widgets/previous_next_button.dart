import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokedex/constants.dart';
import '../pages/list_pokemon.dart';
import '../styles/text_style.dart';

Visibility buttonNextOrPrevious(String url, BuildContext context, String name) {
  return Visibility(
    visible: url != 'null',
    child: Expanded(
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: red700,
          boxShadow: [BoxShadow(offset: Offset(3, 1), color: Colors.black)],
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
