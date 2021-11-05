import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
@JsonSerializable(createToJson: true)
class PaginationModel with _$PaginationModel {
  const PaginationModel._();

  factory PaginationModel({
    required int current,
    required int limit,
    required int count
  }) = _PaginationModel;

  factory PaginationModel.fromMapJson(Map<String, dynamic> map)
      => _$PaginationModelFromJson(map);
}