// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_list_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskListPageStateTearOff {
  const _$TaskListPageStateTearOff();

  _TaskListPageStateLoading loading() {
    return const _TaskListPageStateLoading();
  }

  _TaskListPageStateInitial initial() {
    return const _TaskListPageStateInitial();
  }

  _TaskListPageStateEmpty empty() {
    return const _TaskListPageStateEmpty();
  }

  _TaskListPageStateConnectionError connectionError(
      GeneralConnectionError error) {
    return _TaskListPageStateConnectionError(
      error,
    );
  }

  _TaskListPageStateSignOut signOut() {
    return const _TaskListPageStateSignOut();
  }

  _TaskListPageStateIdle idle(List<Task> taskList, bool loadingMore) {
    return _TaskListPageStateIdle(
      taskList,
      loadingMore,
    );
  }
}

/// @nodoc
const $TaskListPageState = _$TaskListPageStateTearOff();

/// @nodoc
mixin _$TaskListPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListPageStateCopyWith<$Res> {
  factory $TaskListPageStateCopyWith(
          TaskListPageState value, $Res Function(TaskListPageState) then) =
      _$TaskListPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskListPageStateCopyWithImpl<$Res>
    implements $TaskListPageStateCopyWith<$Res> {
  _$TaskListPageStateCopyWithImpl(this._value, this._then);

  final TaskListPageState _value;
  // ignore: unused_field
  final $Res Function(TaskListPageState) _then;
}

/// @nodoc
abstract class _$TaskListPageStateLoadingCopyWith<$Res> {
  factory _$TaskListPageStateLoadingCopyWith(_TaskListPageStateLoading value,
          $Res Function(_TaskListPageStateLoading) then) =
      __$TaskListPageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TaskListPageStateLoadingCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateLoadingCopyWith<$Res> {
  __$TaskListPageStateLoadingCopyWithImpl(_TaskListPageStateLoading _value,
      $Res Function(_TaskListPageStateLoading) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateLoading));

  @override
  _TaskListPageStateLoading get _value =>
      super._value as _TaskListPageStateLoading;
}

/// @nodoc

@Implements(BuildState)
class _$_TaskListPageStateLoading implements _TaskListPageStateLoading {
  const _$_TaskListPageStateLoading();

  @override
  String toString() {
    return 'TaskListPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TaskListPageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateLoading
    implements TaskListPageState, BuildState {
  const factory _TaskListPageStateLoading() = _$_TaskListPageStateLoading;
}

/// @nodoc
abstract class _$TaskListPageStateInitialCopyWith<$Res> {
  factory _$TaskListPageStateInitialCopyWith(_TaskListPageStateInitial value,
          $Res Function(_TaskListPageStateInitial) then) =
      __$TaskListPageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$TaskListPageStateInitialCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateInitialCopyWith<$Res> {
  __$TaskListPageStateInitialCopyWithImpl(_TaskListPageStateInitial _value,
      $Res Function(_TaskListPageStateInitial) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateInitial));

  @override
  _TaskListPageStateInitial get _value =>
      super._value as _TaskListPageStateInitial;
}

/// @nodoc

@Implements(BuildState)
class _$_TaskListPageStateInitial implements _TaskListPageStateInitial {
  const _$_TaskListPageStateInitial();

  @override
  String toString() {
    return 'TaskListPageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TaskListPageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateInitial
    implements TaskListPageState, BuildState {
  const factory _TaskListPageStateInitial() = _$_TaskListPageStateInitial;
}

/// @nodoc
abstract class _$TaskListPageStateEmptyCopyWith<$Res> {
  factory _$TaskListPageStateEmptyCopyWith(_TaskListPageStateEmpty value,
          $Res Function(_TaskListPageStateEmpty) then) =
      __$TaskListPageStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$TaskListPageStateEmptyCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateEmptyCopyWith<$Res> {
  __$TaskListPageStateEmptyCopyWithImpl(_TaskListPageStateEmpty _value,
      $Res Function(_TaskListPageStateEmpty) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateEmpty));

  @override
  _TaskListPageStateEmpty get _value => super._value as _TaskListPageStateEmpty;
}

/// @nodoc

@Implements(BuildState)
class _$_TaskListPageStateEmpty implements _TaskListPageStateEmpty {
  const _$_TaskListPageStateEmpty();

  @override
  String toString() {
    return 'TaskListPageState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TaskListPageStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateEmpty
    implements TaskListPageState, BuildState {
  const factory _TaskListPageStateEmpty() = _$_TaskListPageStateEmpty;
}

/// @nodoc
abstract class _$TaskListPageStateConnectionErrorCopyWith<$Res> {
  factory _$TaskListPageStateConnectionErrorCopyWith(
          _TaskListPageStateConnectionError value,
          $Res Function(_TaskListPageStateConnectionError) then) =
      __$TaskListPageStateConnectionErrorCopyWithImpl<$Res>;
  $Res call({GeneralConnectionError error});

  $GeneralConnectionErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$TaskListPageStateConnectionErrorCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateConnectionErrorCopyWith<$Res> {
  __$TaskListPageStateConnectionErrorCopyWithImpl(
      _TaskListPageStateConnectionError _value,
      $Res Function(_TaskListPageStateConnectionError) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateConnectionError));

  @override
  _TaskListPageStateConnectionError get _value =>
      super._value as _TaskListPageStateConnectionError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_TaskListPageStateConnectionError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GeneralConnectionError,
    ));
  }

  @override
  $GeneralConnectionErrorCopyWith<$Res> get error {
    return $GeneralConnectionErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_TaskListPageStateConnectionError
    implements _TaskListPageStateConnectionError {
  const _$_TaskListPageStateConnectionError(this.error);

  @override
  final GeneralConnectionError error;

  @override
  String toString() {
    return 'TaskListPageState.connectionError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskListPageStateConnectionError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$TaskListPageStateConnectionErrorCopyWith<_TaskListPageStateConnectionError>
      get copyWith => __$TaskListPageStateConnectionErrorCopyWithImpl<
          _TaskListPageStateConnectionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return connectionError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return connectionError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateConnectionError implements TaskListPageState {
  const factory _TaskListPageStateConnectionError(
      GeneralConnectionError error) = _$_TaskListPageStateConnectionError;

  GeneralConnectionError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TaskListPageStateConnectionErrorCopyWith<_TaskListPageStateConnectionError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TaskListPageStateSignOutCopyWith<$Res> {
  factory _$TaskListPageStateSignOutCopyWith(_TaskListPageStateSignOut value,
          $Res Function(_TaskListPageStateSignOut) then) =
      __$TaskListPageStateSignOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$TaskListPageStateSignOutCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateSignOutCopyWith<$Res> {
  __$TaskListPageStateSignOutCopyWithImpl(_TaskListPageStateSignOut _value,
      $Res Function(_TaskListPageStateSignOut) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateSignOut));

  @override
  _TaskListPageStateSignOut get _value =>
      super._value as _TaskListPageStateSignOut;
}

/// @nodoc

class _$_TaskListPageStateSignOut implements _TaskListPageStateSignOut {
  const _$_TaskListPageStateSignOut();

  @override
  String toString() {
    return 'TaskListPageState.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TaskListPageStateSignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateSignOut implements TaskListPageState {
  const factory _TaskListPageStateSignOut() = _$_TaskListPageStateSignOut;
}

/// @nodoc
abstract class _$TaskListPageStateIdleCopyWith<$Res> {
  factory _$TaskListPageStateIdleCopyWith(_TaskListPageStateIdle value,
          $Res Function(_TaskListPageStateIdle) then) =
      __$TaskListPageStateIdleCopyWithImpl<$Res>;
  $Res call({List<Task> taskList, bool loadingMore});
}

/// @nodoc
class __$TaskListPageStateIdleCopyWithImpl<$Res>
    extends _$TaskListPageStateCopyWithImpl<$Res>
    implements _$TaskListPageStateIdleCopyWith<$Res> {
  __$TaskListPageStateIdleCopyWithImpl(_TaskListPageStateIdle _value,
      $Res Function(_TaskListPageStateIdle) _then)
      : super(_value, (v) => _then(v as _TaskListPageStateIdle));

  @override
  _TaskListPageStateIdle get _value => super._value as _TaskListPageStateIdle;

  @override
  $Res call({
    Object? taskList = freezed,
    Object? loadingMore = freezed,
  }) {
    return _then(_TaskListPageStateIdle(
      taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      loadingMore == freezed
          ? _value.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Implements(BuildState)
class _$_TaskListPageStateIdle implements _TaskListPageStateIdle {
  const _$_TaskListPageStateIdle(this.taskList, this.loadingMore);

  @override
  final List<Task> taskList;
  @override
  final bool loadingMore;

  @override
  String toString() {
    return 'TaskListPageState.idle(taskList: $taskList, loadingMore: $loadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskListPageStateIdle &&
            (identical(other.taskList, taskList) ||
                const DeepCollectionEquality()
                    .equals(other.taskList, taskList)) &&
            (identical(other.loadingMore, loadingMore) ||
                const DeepCollectionEquality()
                    .equals(other.loadingMore, loadingMore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskList) ^
      const DeepCollectionEquality().hash(loadingMore);

  @JsonKey(ignore: true)
  @override
  _$TaskListPageStateIdleCopyWith<_TaskListPageStateIdle> get copyWith =>
      __$TaskListPageStateIdleCopyWithImpl<_TaskListPageStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(GeneralConnectionError error) connectionError,
    required TResult Function() signOut,
    required TResult Function(List<Task> taskList, bool loadingMore) idle,
  }) {
    return idle(taskList, loadingMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
  }) {
    return idle?.call(taskList, loadingMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(GeneralConnectionError error)? connectionError,
    TResult Function()? signOut,
    TResult Function(List<Task> taskList, bool loadingMore)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(taskList, loadingMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskListPageStateLoading value) loading,
    required TResult Function(_TaskListPageStateInitial value) initial,
    required TResult Function(_TaskListPageStateEmpty value) empty,
    required TResult Function(_TaskListPageStateConnectionError value)
        connectionError,
    required TResult Function(_TaskListPageStateSignOut value) signOut,
    required TResult Function(_TaskListPageStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskListPageStateLoading value)? loading,
    TResult Function(_TaskListPageStateInitial value)? initial,
    TResult Function(_TaskListPageStateEmpty value)? empty,
    TResult Function(_TaskListPageStateConnectionError value)? connectionError,
    TResult Function(_TaskListPageStateSignOut value)? signOut,
    TResult Function(_TaskListPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _TaskListPageStateIdle implements TaskListPageState, BuildState {
  const factory _TaskListPageStateIdle(List<Task> taskList, bool loadingMore) =
      _$_TaskListPageStateIdle;

  List<Task> get taskList => throw _privateConstructorUsedError;
  bool get loadingMore => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TaskListPageStateIdleCopyWith<_TaskListPageStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
