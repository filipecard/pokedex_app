import 'stats_pokemon.dart';
import 'type_pokemon.dart';

class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final List<StatsPokemon> stats;
  final List<TypePokemon> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.stats,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprite: json['sprites']['front_default'],
      stats: toListStatsPokemon(json['stats']),
      types: toListTypePokemon(json['types']),
    );
  }
}

List<StatsPokemon> toListStatsPokemon(List<dynamic> json) {
  return json.map((data) => StatsPokemon.fromJson(data)).toList();
}

List<TypePokemon> toListTypePokemon(List<dynamic> json) {
  return json.map((data) => TypePokemon.fromJson(data)).toList();
}
