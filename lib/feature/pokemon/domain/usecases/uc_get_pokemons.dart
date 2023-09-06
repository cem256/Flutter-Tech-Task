import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';

final class UCGetPokemonns {
  UCGetPokemonns({required PokemonRepository repository}) : _repository = repository;

  final PokemonRepository _repository;

  Future<Either<Failure, List<PokemonEntity>>> call({required int offset, required int limit}) {
    return _repository.getPokemons(offset: offset, limit: limit);
  }
}
