part of 'pokemon_details_cubit.dart';

final class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.failure,
    this.pokemon,
    this.status = ViewStatus.loading,
  });

  final ViewStatus status;
  final PokemonDetailEntity? pokemon;
  final Failure? failure;

  @override
  List<Object?> get props => [status, pokemon, failure];

  PokemonDetailsState copyWith({
    ViewStatus? status,
    PokemonDetailEntity? pokemon,
    Failure? failure,
  }) {
    return PokemonDetailsState(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
      failure: failure ?? this.failure,
    );
  }
}
