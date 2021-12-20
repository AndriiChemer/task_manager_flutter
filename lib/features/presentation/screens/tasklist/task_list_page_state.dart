part of 'task_list_page_cubit.dart';

@freezed
class TaskListPageState with _$TaskListPageState {

  @Implements(BuildState)
  const factory TaskListPageState.loading() = _TaskListPageStateLoading;

  @Implements(BuildState)
  const factory TaskListPageState.initial() = _TaskListPageStateInitial;

  @Implements(BuildState)
  const factory TaskListPageState.empty() = _TaskListPageStateEmpty;

  const factory TaskListPageState.connectionError(GeneralConnectionError error) = _TaskListPageStateConnectionError;

  const factory TaskListPageState.signOut() = _TaskListPageStateSignOut;

  @Implements(BuildState)
  const factory TaskListPageState.idle(
      List<Task> taskList,
      bool loadingMore,
  ) = _TaskListPageStateIdle;
}
