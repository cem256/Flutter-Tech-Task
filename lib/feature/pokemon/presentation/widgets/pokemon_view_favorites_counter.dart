part of '../view/pokemon_view.dart';

class _PokemonViewFavoritesCounter extends StatelessWidget {
  const _PokemonViewFavoritesCounter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Padding(
          padding: context.paddingRightDefault,
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: context.theme.colorScheme.error,
              ),
              Text(state.pokemons.length.toString()),
            ],
          ),
        );
      },
    );
  }
}
