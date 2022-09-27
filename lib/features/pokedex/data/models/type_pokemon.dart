class TypePokemon {
  final int slot;
  final String name;

  TypePokemon({required this.slot, required this.name});

  factory TypePokemon.fromJson(Map<String, dynamic> json) {
    return TypePokemon(
      slot: json['slot'],
      name: json['type']['name'],
    );
  }
}
