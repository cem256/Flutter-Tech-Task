import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/core/enums/view_status.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/usecases/uc_get_pokemon_details.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit({required UCGetPokemonDetails ucGetPokemonDetails})
      : _ucGetPokemonDetails = ucGetPokemonDetails,
        super(const PokemonDetailsState());

  final UCGetPokemonDetails _ucGetPokemonDetails;

  Future<void> getPokemonDetails({required String name}) async {
    emit(state.copyWith(status: ViewStatus.loading));

    final result = await _ucGetPokemonDetails.call(name: name);

    result.fold(
      (failure) => emit(
        state.copyWith(failure: failure, status: ViewStatus.failure),
      ),
      (success) => emit(
        state.copyWith(pokemon: success, status: ViewStatus.success),
      ),
    );
  }
}
