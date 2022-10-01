import '../../domain/entities/simple_pokemon.dart';

class ControllerPagePokemon {
  final int count;
  final String next;
  final String previous;
  final List<SimplesPokemon> result;

  ControllerPagePokemon(
      {required this.count,
      required this.next,
      required this.previous,
      required this.result});

  factory ControllerPagePokemon.fromJson(Map<String, dynamic> json) {
    return ControllerPagePokemon(
        count: json['count'],
        next: json['next'],
        previous: json['previous'].toString(),
        result: toListSimplesPokemon(json['results']));
  }
}
