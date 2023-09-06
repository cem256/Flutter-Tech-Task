import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/app/errors/failures/failures.dart';
import 'package:flutter_tech_task/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:flutter_tech_task/feature/favorites/domain/usecases/uc_get_favorites.dart';
import 'package:flutter_tech_task/feature/pokemon/domain/entities/pokemon/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock implements FavoritesRepository {}

class MockPokemonEntity extends Mock implements PokemonEntity {}

void main() {
  late MockFavoriteRepository repository;
  late UCGetFavorites uc;
  late List<MockPokemonEntity> mockEntity;

  setUp(() {
    repository = MockFavoriteRepository();
    uc = UCGetFavorites(repository: repository);
    mockEntity = List.generate(50, (_) => MockPokemonEntity());
  });

  test('Returns Right with List of MockPokemonEntity when there is no exception', () async {
    when(() => repository.getFavorites()).thenReturn(Right(mockEntity));
    final result = uc();

    verify(() => uc());
    expect(result, isA<Right<Failure, List<PokemonEntity>>>());
  });

  test('Returns Left with Failure type when an exception caught', () async {
    when(() => repository.getFavorites()).thenReturn(Left(UnknownFailure()));
    final result = uc();

    verify(() => uc());
    expect(result, isA<Left<Failure, List<PokemonEntity>>>());
  });
}
