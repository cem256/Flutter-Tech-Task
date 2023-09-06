part of 'pokemon_details_success_widget.dart';

class _PokemonDetailsImage extends StatelessWidget {
  const _PokemonDetailsImage({required this.pokemon});

  final PokemonDetailEntity pokemon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.veryhighValue3x,
      child: Image.network(
        pokemon.sprites.defaultImage,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
