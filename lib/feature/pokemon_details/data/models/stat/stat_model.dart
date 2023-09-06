// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/stat/stat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat_model.g.dart';

@JsonSerializable(createToJson: false)
class StatModel extends Equatable {
  const StatModel({this.stat, this.name});

  factory StatModel.fromJson(Map<String, dynamic> data) => _$StatModelFromJson(data);

  @JsonKey(name: 'base_stat')
  final double? stat;
  @JsonKey(name: 'stat', fromJson: _nameFromJson)
  final String? name;

  @override
  List<Object?> get props => [stat, name];

  static String? _nameFromJson(Map<String, dynamic> json) {
    return json['name'] as String?;
  }

  StatEntity toEntity() {
    return StatEntity(
      stat: stat ?? StatEntity.initial().stat,
      name: name ?? StatEntity.initial().name,
    );
  }
}
