import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/app/widgets/error/custom_error_widget.dart';
import 'package:flutter_tech_task/core/enums/view_status.dart';
import 'package:flutter_tech_task/core/extensions/string_extensions.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:flutter_tech_task/feature/pokemon_details/presentation/widgets/pokemon_details_success_widget.dart';
import 'package:flutter_tech_task/locator.dart';

@RoutePage()
class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({required this.pokemon, super.key});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name.capitalizeFirstLetter(),
        ),
      ),
      body: BlocProvider<PokemonDetailsCubit>(
        create: (context) => Locator.pokemonDetailsCubit..getPokemonDetails(name: pokemon.name),
        child: _PokemonDetailsViewBody(pokemon: pokemon),
      ),
    );
  }
}

class _PokemonDetailsViewBody extends StatelessWidget {
  const _PokemonDetailsViewBody({required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        return switch (state.status) {
          ViewStatus.loading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ViewStatus.success => PokemonDetailsSuccessWidget(
              pokemon: state.pokemon!,
            ),
          ViewStatus.failure => Center(
              child: CustomErrorWidget(
                failure: state.failure ?? UnknownFailure(),
                onPressed: () => context.read<PokemonDetailsCubit>().getPokemonDetails(name: pokemon.name),
              ),
            )
        };
      },
    );
  }
}
