import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class SpritesEntity extends Equatable {
  const SpritesEntity({required this.defaultImage});

  factory SpritesEntity.initial() => const SpritesEntity(defaultImage: '');

  final String defaultImage;

  @override
  List<Object?> get props => [defaultImage];
}
