import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/usecases/uc_get_pokemons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockPokemonEntity extends Mock implements PokemonEntity {}

void main() {
  late MockPokemonRepository repository;
  late UCGetPokemons uc;
  late List<MockPokemonEntity> mockEntity;
  late int offset;
  late int limit;

  setUp(() {
    offset = 0;
    limit = 20;
    repository = MockPokemonRepository();
    uc = UCGetPokemons(repository: repository);
    mockEntity = List.generate(limit, (_) => MockPokemonEntity());
  });

  test('Returns Right with List of PokemonEntity when there is no exception', () async {
    when(() => repository.getPokemons(offset: offset, limit: limit)).thenAnswer((_) async => Right(mockEntity));
    final result = await uc(offset: offset, limit: limit);

    verify(() => uc(offset: offset, limit: limit));
    expect(result, isA<Right<Failure, List<PokemonEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => repository.getPokemons(offset: offset, limit: limit)).thenAnswer((_) async => Left(UnknownFailure()));
    final result = await uc(offset: offset, limit: limit);

    verify(() => uc(offset: offset, limit: limit));
    expect(result, isA<Left<Failure, List<PokemonEntity>>>());
  });
}
