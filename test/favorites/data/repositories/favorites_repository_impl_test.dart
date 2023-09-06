import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:flutter_tech_task/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:flutter_tech_task/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteLocalDataSource extends Mock implements FavoritesLocalDataSource {}

class MockPokemonEntity extends Mock implements PokemonEntity {}

void main() {
  late MockFavoriteLocalDataSource dataSource;
  late FavoritesRepository repository;
  late List<MockPokemonEntity> mockEntity;

  setUp(() {
    dataSource = MockFavoriteLocalDataSource();
    repository = FavoritesRepositoryImpl(dataSource: dataSource);
    mockEntity = List.generate(50, (_) => MockPokemonEntity());
  });

  test('Returns Right with List of MockPokemonEntity when there is no exception', () async {
    when(() => dataSource.getFavorites()).thenReturn(mockEntity);
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Right<Failure, List<PokemonEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => dataSource.getFavorites()).thenThrow(Exception());
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Left<Failure, List<PokemonEntity>>>());
  });
}
