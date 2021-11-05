part of 'show_task_cubit.dart';

abstract class ShowTaskState extends Equatable {
  const ShowTaskState();
}

class ShowTaskInitial extends ShowTaskState {
  @override
  List<Object> get props => [];
}

class ShowTaskDetail extends ShowTaskState {
  final TaskModel taskModel;

  ShowTaskDetail({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}
