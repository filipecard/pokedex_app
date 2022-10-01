import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokedex/presentation/styles/text_style.dart';
import '../../../../main.dart';

Widget appBarTitle(BuildContext context) {
  return Center(
    child: TextButton(
      child: Text(
        'Pokedex',
        style: defaultTextStyle(baseFontSize: 25),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(
              title: 'Pokedex',
            ),
          ),
        );
      },
    ),
  );
}
