import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/extensions/context_extensions.dart';
import 'package:flutter_tech_task/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

class FavoritesButtonWidget extends StatelessWidget {
  const FavoritesButtonWidget({required this.pokemon, super.key});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => context.read<FavoritesCubit>().addOrRemoveFavorite(pokemon: pokemon),
          icon: Icon(
            Icons.star_rate_rounded,
            color: state.pokemons.any((favorite) => favorite.name == pokemon.name)
                ? context.theme.colorScheme.error
                : context.theme.colorScheme.outline,
          ),
        );
      },
    );
  }
}
