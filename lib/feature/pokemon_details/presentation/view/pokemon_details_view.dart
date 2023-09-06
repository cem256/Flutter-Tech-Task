import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/extensions/string_extensions.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

@RoutePage()
class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({required this.pokemon, super.key});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.capitalizeFirstLetter()),
      ),
    );
  }
}
