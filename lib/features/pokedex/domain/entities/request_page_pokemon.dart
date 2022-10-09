import 'simple_pokemon.dart';

class RequestPagePokemon {
  final int count;
  final String next;
  final String previous;
  final List<SimplesPokemon> result;

  RequestPagePokemon(
      {required this.count,
      required this.next,
      required this.previous,
      required this.result});

  factory RequestPagePokemon.fromJson(Map<String, dynamic> json) {
    return RequestPagePokemon(
        count: json['count'],
        next: json['next'],
        previous: json['previous'].toString(),
        result: toListSimplesPokemon(json['results']));
  }
}
