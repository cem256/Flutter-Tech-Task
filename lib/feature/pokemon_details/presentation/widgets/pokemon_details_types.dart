part of 'pokemon_details_success_widget.dart';

class _PokemonDetailsTypes extends StatelessWidget {
  const _PokemonDetailsTypes({required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.lowValue,
      runSpacing: context.lowValue,
      children: [
        ...pokemon.types.map(
          (type) => Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: context.paddingAllLow,
              child: Text(type.type.capitalizeFirstLetter()),
            ),
          ),
        ),
      ],
    );
  }
}
