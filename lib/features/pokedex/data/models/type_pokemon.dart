class TypePokemon {
  final int slot;
  final String name;
  final String url;

  TypePokemon({required this.slot, required this.name, required this.url});

  factory TypePokemon.fromJson(Map<String, dynamic> json) {
    return TypePokemon(
      slot: json['slot'],
      name: json['type']['name'],
      url: json['type']['url'],
    );
  }
}
