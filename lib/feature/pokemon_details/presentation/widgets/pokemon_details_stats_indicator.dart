part of 'pokemon_details_success_widget.dart';

class _PokemonDetailsStatsIndicator extends StatelessWidget {
  const _PokemonDetailsStatsIndicator({required this.stat});

  final StatEntity stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stat.name.capitalizeFirstLetter(),
        ),
        SizedBox(
          height: context.lowValue,
        ),
        LinearProgressIndicator(
          minHeight: context.defaultValue,
          color: context.theme.colorScheme.inversePrimary,
          value: stat.stat / 100,
        ),
      ],
    );
  }
}
