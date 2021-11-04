class TaskRequest {
  final int? id;
  final String title;
  final int dueBy;
  final String priority;

  //TODO add annotation
  TaskRequest({
    this.id,
    required this.title,
    required this.dueBy,
    required this.priority,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "dueBy": dueBy,
    "priority": priority,
  };
}