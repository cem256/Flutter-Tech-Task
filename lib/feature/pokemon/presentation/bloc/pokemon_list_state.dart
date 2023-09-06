part of 'pokemon_list_bloc.dart';

final class PokemonListState extends Equatable {
  const PokemonListState({
    this.failure,
    this.status = ViewStatus.loading,
    this.pokemons = const <PokemonEntity>[],
    this.hasReachedMax = false,
  });

  final ViewStatus status;
  final List<PokemonEntity> pokemons;
  final bool hasReachedMax;
  final Failure? failure;

  @override
  List<Object?> get props => [status, pokemons, hasReachedMax, failure];

  PokemonListState copyWith({
    ViewStatus? status,
    List<PokemonEntity>? pokemons,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return PokemonListState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
