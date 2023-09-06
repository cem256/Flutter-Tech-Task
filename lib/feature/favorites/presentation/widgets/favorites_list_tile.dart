part of '../view/favorites_view.dart';

class _FavoritesListTile extends StatelessWidget {
  const _FavoritesListTile({required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => context.router.push(PokemonDetailsRoute(pokemon: pokemon)),
      title: Text(pokemon.name.capitalizeFirstLetter()),
      trailing: FavoritesButtonWidget(pokemon: pokemon),
    );
  }
}
