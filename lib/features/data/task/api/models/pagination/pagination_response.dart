import 'package:flutter_task_manager/features/data/common/data_mapper.dart';
import 'package:flutter_task_manager/features/domain/task/model/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pagination_response.g.dart';

@JsonSerializable(createToJson: true)
class PaginationResponse {
  final int current;
  final int limit;
  final int count;
  PaginationResponse({
    required this.current,
    required this.limit,
    required this.count,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> map)
      => _$PaginationResponseFromJson(map);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

@Injectable()
class PaginationMapper implements DataMapper<PaginationResponse, Pagination> {
  @override
  Pagination call(PaginationResponse data) =>
      Pagination(
        current: data.current,
        limit: data.limit,
        count: data.count,
      );
}