part of 'add_edit_task_page_cubit.dart';

@freezed
class AddEditTaskPageState with _$AddEditTaskPageState {
  @Implements(BuildState)
  const factory AddEditTaskPageState.loading() = _AddEditTaskPageStateLoading;

  @Implements(BuildState)
  const factory AddEditTaskPageState.initial() = _AddEditTaskPageStateInitial;

  @Implements(BuildState)
  const factory AddEditTaskPageState.idle(Set<TaskValid> errors) = _AddEditTaskPageStateIdle;

  const factory AddEditTaskPageState.error() = _AddEditTaskPageStateError;

  const factory AddEditTaskPageState.addingSuccess() = _AddEditTaskPageStateAddingSuccess;

  const factory AddEditTaskPageState.editingSuccess(Task task) = _AddEditTaskPageStateEditingSuccess;

  const factory AddEditTaskPageState.connectionError(GeneralConnectionError error) = _AddEditTaskPageStateConnectionError;
}