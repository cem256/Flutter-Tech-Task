import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/extensions/string_extensions.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

class PokemonViewCardItem extends StatelessWidget {
  const PokemonViewCardItem({required this.pokemon, super.key});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.star_rate_rounded),
              onPressed: () {},
            ),
          ),
          Center(
            child: Text(pokemon.name.capitalizeFirstLetter()),
          ),
        ],
      ),
    );
  }
}
