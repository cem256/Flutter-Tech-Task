// ignore_for_file: cascade_invocations

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/favorites/domain/usecases/uc_add_or_remove_favorite.dart';
import 'package:flutter_tech_task/feature/favorites/domain/usecases/uc_get_favorites.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required UCGetFavorites ucGetFavorites, required UCAddOrRemoveFavorite ucAddOrRemoveFavorite})
      : _ucGetFavorites = ucGetFavorites,
        _ucAddOrRemoveFavorite = ucAddOrRemoveFavorite,
        super(const FavoritesState());

  final UCGetFavorites _ucGetFavorites;
  final UCAddOrRemoveFavorite _ucAddOrRemoveFavorite;

  void getFavorites() {
    emit(state.copyWith(status: FavoritesStatus.loading));

    final response = _ucGetFavorites();

    response.fold((failure) => emit(state.copyWith(status: FavoritesStatus.failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(pokemons: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(status: FavoritesStatus.success, pokemons: success));
    });
  }

  Future<void> addOrRemoveFavorite({required PokemonEntity pokemon}) async {
    final response = await _ucAddOrRemoveFavorite(pokemon);

    response.fold((failure) => emit(state.copyWith(status: FavoritesStatus.failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(pokemons: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(pokemons: success, status: FavoritesStatus.success));
    });
  }
}
