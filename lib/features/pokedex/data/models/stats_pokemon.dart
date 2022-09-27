class StatsPokemon {
  final int baseStat;
  final String name;

  StatsPokemon({required this.baseStat, required this.name});

  factory StatsPokemon.fromJson(Map<String, dynamic> json) {
    return StatsPokemon(
      baseStat: json['base_stat'],
      name: json['stat']['name'],
    );
  }
}
