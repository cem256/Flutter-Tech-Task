import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/extensions/context_extensions.dart';
import 'package:flutter_tech_task/core/extensions/string_extensions.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/stat/stat_entity.dart';

part 'pokemon_details_image.dart';
part 'pokemon_details_types.dart';
part 'pokemon_details_stats_row.dart';
part 'pokemon_details_stats_indicator.dart';

class PokemonDetailsSuccessWidget extends StatelessWidget {
  const PokemonDetailsSuccessWidget({required this.pokemon, super.key});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PokemonDetailsImage(
            pokemon: pokemon,
          ),
          Padding(
            padding: context.paddingAllDefault,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PokemonDetailsTypes(
                  pokemon: pokemon,
                ),
                SizedBox(height: context.lowValue),
                Text(
                  'Stats',
                  style: context.textTheme.headlineSmall,
                ),
                SizedBox(
                  height: context.lowValue,
                ),
                _PokemondDetailsStatsRow(
                  pokemon: pokemon,
                ),
                SizedBox(
                  height: context.defaultValue,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pokemon.stats.length,
                  separatorBuilder: (context, index) => SizedBox(height: context.lowValue),
                  itemBuilder: (context, index) => _PokemonDetailsStatsIndicator(
                    stat: pokemon.stats[index],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
