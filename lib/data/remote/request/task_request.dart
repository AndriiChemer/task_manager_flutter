class TaskRequest {
  final String title;
  final int dueBy;
  final String priority;
  final String description;

  TaskRequest({
    required this.title,
    required this.dueBy,
    required this.priority,
    required this.description
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "dueBy": dueBy,
    "priority": priority,
    "description": description
  };
}