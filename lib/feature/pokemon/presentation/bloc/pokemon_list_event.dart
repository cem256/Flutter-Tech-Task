part of 'pokemon_list_bloc.dart';

abstract final class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch pokemons
final class PokemonListFetched extends PokemonListEvent {
  @override
  List<Object> get props => [];
}
