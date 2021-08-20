import 'response.dart';

class TaskListResponse {
  final List<TaskResponse> tasks;
  final PaginationResponse meta;

  TaskListResponse({
    required this.tasks,
    required this.meta});

  factory TaskListResponse.fromJson(Map<String, dynamic> json) {

    var tasks = (json["tasks"] as List<dynamic>).map((element) {
      print(element);
      return TaskResponse.fromJson(element);
    }).toList();

    return TaskListResponse(
        tasks: tasks,
        meta: PaginationResponse.fromJson(json["meta"])
    );
  }
}

class PaginationResponse {
  final int current;
  final int limit;
  final int count;

  PaginationResponse({
    required this.current,
    required this.limit,
    required this.count});

  factory PaginationResponse.fromJson(Map<String, dynamic> json) {

    return PaginationResponse(
        current: json["current"],
        limit: json["limit"],
        count: json["count"],
    );
  }
}