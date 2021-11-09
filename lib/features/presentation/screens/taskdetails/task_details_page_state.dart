part of 'task_details_page_cubit.dart';

@freezed
class TaskDetailsPageState with _$TaskDetailsPageState {

  @Implements(BuildState)
  const factory TaskDetailsPageState.initial() = _TaskDetailsPageStateInitial;

  @Implements(BuildState)
  const factory TaskDetailsPageState.loading() = _TaskDetailsPageStateLoading;

  @Implements(BuildState)
  const factory TaskDetailsPageState.error() = _TaskDetailsPageStateError;

  @Implements(BuildState)
  const factory TaskDetailsPageState.idle() = _TaskDetailsPageStateIdle;

  const factory TaskDetailsPageState.connectionError(GeneralConnectionError error) = _TaskDetailsPageStateConnectionError;

  const factory TaskDetailsPageState.success() = _TaskDetailsPageStateSuccess;
}
