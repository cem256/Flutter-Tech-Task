part of 'pokemon_details_success_widget.dart';

class _PokemondDetailsStatsRow extends StatelessWidget {
  const _PokemondDetailsStatsRow({required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _RowItem(
          title: 'Base Exp.',
          subtitle: '${pokemon.baseExperience}',
        ),
        _RowItem(
          title: 'Height(m)',
          subtitle: '${pokemon.height}',
        ),
        _RowItem(
          title: 'Weight(kgs)',
          subtitle: '${pokemon.weight}',
        ),
      ],
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingAllLow,
        child: Column(
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            Text(
              subtitle,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
