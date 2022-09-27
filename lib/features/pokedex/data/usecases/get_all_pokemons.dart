import '../models/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetAllPokemons {
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  Future<List<Pokemon>> call() async {
    return pokemonRepository.getAllPokemons();
  }
}
