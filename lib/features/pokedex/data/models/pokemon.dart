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
        stats: json['stats'],
        types: json['types']);
  }
}
