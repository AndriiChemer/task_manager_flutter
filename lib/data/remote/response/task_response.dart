class TaskResponse {
  final int id;
  final String title;
  final int dueBy;
  final String priority;

  TaskResponse({
    required this.id,
    required this.title,
    required this.dueBy,
    required this.priority});

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return TaskResponse(
        id: json["id"] as int,
        title: json["title"],
        dueBy: json["dueBy"] as int,
        priority: json["priority"]
    );
  }
}