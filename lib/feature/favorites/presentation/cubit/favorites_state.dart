part of 'favorites_cubit.dart';

enum FavoritesStatus { loading, success, failure, empty }

final class FavoritesState extends Equatable {
  const FavoritesState({
    this.failure,
    this.status = FavoritesStatus.loading,
    this.pokemons = const <PokemonEntity>[],
  });

  final Failure? failure;
  final FavoritesStatus status;
  final List<PokemonEntity> pokemons;

  @override
  List<Object?> get props => [failure, status, pokemons];

  FavoritesState copyWith({
    Failure? failure,
    FavoritesStatus? status,
    List<PokemonEntity>? pokemons,
  }) {
    return FavoritesState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
