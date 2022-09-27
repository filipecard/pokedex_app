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
