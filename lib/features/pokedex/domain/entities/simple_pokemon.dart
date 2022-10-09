import 'package:equatable/equatable.dart';

class SimplesPokemon extends Equatable {
  final String name;
  final String url;

  const SimplesPokemon({required this.name, required this.url});

  factory SimplesPokemon.fromJson(Map<String, dynamic> json) {
    return SimplesPokemon(name: json['name'], url: json['url']);
  }

  @override
  List<Object?> get props => [name, url];
}

List<SimplesPokemon> toListSimplesPokemon(List<dynamic> json) {
  return json.map((data) => SimplesPokemon.fromJson(data)).toList();
}
