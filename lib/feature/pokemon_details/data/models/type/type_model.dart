import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/type/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable(createToJson: false)
class TypeModel extends Equatable {
  const TypeModel({this.type});

  factory TypeModel.fromJson(Map<String, dynamic> data) => _$TypeModelFromJson(data);

  @JsonKey(fromJson: _typeFromJson)
  final String? type;

  @override
  List<Object?> get props => [type];

  static String? _typeFromJson(Map<String, dynamic> json) {
    return json['name'] as String?;
  }

  TypeEntity toEntity() {
    return TypeEntity(
      type: type ?? TypeEntity.initial().type,
    );
  }
}
