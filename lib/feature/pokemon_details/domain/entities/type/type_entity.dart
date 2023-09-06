import 'package:equatable/equatable.dart';

class TypeEntity extends Equatable {
  const TypeEntity({required this.type});

  factory TypeEntity.initial() => const TypeEntity(type: '');

  final String type;

  @override
  List<Object?> get props => [type];
}
