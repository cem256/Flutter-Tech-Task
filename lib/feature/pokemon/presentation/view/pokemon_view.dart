import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/app/router/app_router.gr.dart';
import 'package:flutter_tech_task/app/widgets/error/custom_error_widget.dart';
import 'package:flutter_tech_task/core/enums/view_status.dart';
import 'package:flutter_tech_task/core/extensions/context_extensions.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:flutter_tech_task/feature/pokemon/presentation/widgets/pokemon_view_card_item.dart';
import 'package:flutter_tech_task/locator.dart';

part '../widgets/pokemon_view_success_widget.dart';

@RoutePage()
class PokemonView extends StatelessWidget {
  const PokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: BlocProvider<PokemonListBloc>(
        create: (context) => Locator.pokemonListBloc..add(PokemonListFetched()),
        child: const _PokemonViewBody(),
      ),
    );
  }
}

class _PokemonViewBody extends StatelessWidget {
  const _PokemonViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        return switch (state.status) {
          ViewStatus.loading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ViewStatus.success => Padding(
              padding: context.paddingAllDefault,
              child: _PokemonViewSuccessWidget(
                pokemons: state.pokemons,
                hasReachedMax: state.hasReachedMax,
              ),
            ),
          ViewStatus.failure => Center(
              child: CustomErrorWidget(
                failure: state.failure ?? UnknownFailure(),
                onPressed: () => context.read<PokemonListBloc>()..add(PokemonListFetched()),
              ),
            )
        };
      },
    );
  }
}
