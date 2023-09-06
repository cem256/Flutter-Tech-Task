import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/constants/duration_constants.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/core/enums/view_status.dart';
import 'package:flutter_tech_task/core/utils/event_transformer/event_tranformer_utils.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/usecases/uc_get_pokemons.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc({required UCGetPokemons ucGetPokemons})
      : _ucGetPokemons = ucGetPokemons,
        super(const PokemonListState()) {
    on<PokemonListFetched>(
      _onPokemonListFetched,
      transformer: EventTransformerUtils.throttle(DurationConstants.medium()),
    );
  }
  int _offset = 0;
  final int _limit = 20;

  final UCGetPokemons _ucGetPokemons;

  Future<void> _onPokemonListFetched(PokemonListFetched event, Emitter<PokemonListState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == ViewStatus.loading) {
      final result = await _ucGetPokemons(offset: _offset, limit: _limit);
      return result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
        _offset += _limit;
        emit(
          success.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: ViewStatus.success,
                  pokemons: List.of(state.pokemons)..addAll(success),
                  hasReachedMax: false,
                ),
        );
      });
    }
    final result = await _ucGetPokemons(offset: _offset, limit: _limit);
    result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
      _offset += _limit;
      emit(
        success.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: ViewStatus.success,
                pokemons: List.of(state.pokemons)..addAll(success),
                hasReachedMax: false,
              ),
      );
    });
  }
}
