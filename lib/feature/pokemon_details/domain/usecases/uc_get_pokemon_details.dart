import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/pokemon_detail/pokemon_detail_entity.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/repositories/pokemon_details_repository.dart';

final class UCGetPokemonDetails {
  UCGetPokemonDetails({required PokemonDetailsRepository repository}) : _repository = repository;

  final PokemonDetailsRepository _repository;

  Future<Either<Failure, PokemonDetailEntity>> call({required String name}) {
    return _repository.getPokemonDetails(name: name);
  }
}
