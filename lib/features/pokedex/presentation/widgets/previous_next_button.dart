import 'package:flutter/material.dart';
import '../pages/list_pokemon.dart';
import '../styles/text_style.dart';

Visibility buttonNextOrPrevious(String url, BuildContext context, String name) {
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
