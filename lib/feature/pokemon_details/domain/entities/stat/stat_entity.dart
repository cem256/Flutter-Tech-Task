import 'package:equatable/equatable.dart';

class StatEntity extends Equatable {
  const StatEntity({required this.stat, required this.name});

  factory StatEntity.initial() => const StatEntity(stat: 0, name: '');

  final double stat;
  final String name;

  @override
  List<Object?> get props => [stat, name];
}
