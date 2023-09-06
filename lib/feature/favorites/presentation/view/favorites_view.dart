import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/router/app_router.gr.dart';
import 'package:flutter_tech_task/app/widgets/button/favorites_button_widget.dart';
import 'package:flutter_tech_task/app/widgets/error/custom_error_widget.dart';
import 'package:flutter_tech_task/core/extensions/context_extensions.dart';
import 'package:flutter_tech_task/core/extensions/string_extensions.dart';
import 'package:flutter_tech_task/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

part '../widgets/favorites_list_tile.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return switch (state.status) {
            FavoritesStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            FavoritesStatus.empty => Center(
                child: Text(
                  "You Don't Have Any Favorites Yet",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            FavoritesStatus.failure => Center(
                child: CustomErrorWidget(
                  failure: state.failure!,
                  onPressed: () => context.read<FavoritesCubit>().getFavorites(),
                ),
              ),
            FavoritesStatus.success => Padding(
                padding: context.paddingAllDefault,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) => _FavoritesListTile(
                    pokemon: state.pokemons[index],
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
