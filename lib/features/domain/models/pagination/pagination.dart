import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const Pagination._();

  factory Pagination({
    required int current,
    required int limit,
    required int count
  }) = _Pagination;
}