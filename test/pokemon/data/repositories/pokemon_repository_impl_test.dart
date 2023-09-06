import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:flutter_tech_task/feature/pokemon/data/models/pokemon/pokemon_model.dart';
import 'package:flutter_tech_task/feature/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonRemoteDataSource extends Mock implements PokemonRemoteDataSource {}

class MockPokemonModel extends Mock implements PokemonModel {}

void main() {
  late MockPokemonRemoteDataSource dataSource;
  late PokemonRepository repository;
  late List<MockPokemonModel> mockModel;
  late int offset;
  late int limit;

  setUp(() {
    offset = 0;
    limit = 20;
    dataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(dataSource: dataSource);
    mockModel = List.generate(limit, (_) => MockPokemonModel());
  });

  test('Returns Right with List of PokemonModel when there is no exception', () async {
    when(() => dataSource.getPokemons(offset: offset, limit: limit)).thenAnswer((_) async => mockModel);
    final result = await repository.getPokemons(offset: offset, limit: limit);

    verify(() => dataSource.getPokemons(offset: offset, limit: limit));

    expect(result, isA<Right<Failure, List<PokemonEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => dataSource.getPokemons(offset: offset, limit: limit)).thenThrow(Exception());
    final result = await repository.getPokemons(offset: offset, limit: limit);

    verify(() => dataSource.getPokemons(offset: offset, limit: limit));

    expect(result, isA<Left<Failure, List<PokemonEntity>>>());
  });
}
