class SimplesPokemon {
  final String name;
  final String url;

  SimplesPokemon({required this.name, required this.url});

  factory SimplesPokemon.fromJson(Map<String, dynamic> json) {
    return SimplesPokemon(name: json['name'], url: json['url']);
  }
}

List<SimplesPokemon> toListSimplesPokemon(List<dynamic> json) {
  return json.map((data) => SimplesPokemon.fromJson(data)).toList();
}
