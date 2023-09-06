import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/feature/pokemon_details/domain/entities/sprites/sprites_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sprites_model.g.dart';

@JsonSerializable(createToJson: false)
class SpritesModel extends Equatable {
  const SpritesModel({this.defaultImage});

  factory SpritesModel.fromJson(Map<String, dynamic> data) => _$SpritesModelFromJson(data);

  @JsonKey(name: 'back_default')
  final String? defaultImage;

  @override
  List<Object?> get props => [defaultImage];

  SpritesEntity toEntity() {
    return SpritesEntity(
      defaultImage: defaultImage ?? SpritesEntity.initial().defaultImage,
    );
  }
}
