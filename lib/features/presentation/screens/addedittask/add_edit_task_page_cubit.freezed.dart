// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_edit_task_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddEditTaskPageStateTearOff {
  const _$AddEditTaskPageStateTearOff();

  _AddEditTaskPageStateLoading loading() {
    return const _AddEditTaskPageStateLoading();
  }

  _AddEditTaskPageStateInitial initial() {
    return const _AddEditTaskPageStateInitial();
  }

  _AddEditTaskPageStateIdle idle(Set<TaskValid> errors) {
    return _AddEditTaskPageStateIdle(
      errors,
    );
  }

  _AddEditTaskPageStateError error() {
    return const _AddEditTaskPageStateError();
  }

  _AddEditTaskPageStateAddingSuccess addingSuccess() {
    return const _AddEditTaskPageStateAddingSuccess();
  }

  _AddEditTaskPageStateEditingSuccess editingSuccess(Task task) {
    return _AddEditTaskPageStateEditingSuccess(
      task,
    );
  }

  _AddEditTaskPageStateConnectionError connectionError(
      GeneralConnectionError error) {
    return _AddEditTaskPageStateConnectionError(
      error,
    );
  }
}

/// @nodoc
const $AddEditTaskPageState = _$AddEditTaskPageStateTearOff();

/// @nodoc
mixin _$AddEditTaskPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditTaskPageStateCopyWith<$Res> {
  factory $AddEditTaskPageStateCopyWith(AddEditTaskPageState value,
          $Res Function(AddEditTaskPageState) then) =
      _$AddEditTaskPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements $AddEditTaskPageStateCopyWith<$Res> {
  _$AddEditTaskPageStateCopyWithImpl(this._value, this._then);

  final AddEditTaskPageState _value;
  // ignore: unused_field
  final $Res Function(AddEditTaskPageState) _then;
}

/// @nodoc
abstract class _$AddEditTaskPageStateLoadingCopyWith<$Res> {
  factory _$AddEditTaskPageStateLoadingCopyWith(
          _AddEditTaskPageStateLoading value,
          $Res Function(_AddEditTaskPageStateLoading) then) =
      __$AddEditTaskPageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddEditTaskPageStateLoadingCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateLoadingCopyWith<$Res> {
  __$AddEditTaskPageStateLoadingCopyWithImpl(
      _AddEditTaskPageStateLoading _value,
      $Res Function(_AddEditTaskPageStateLoading) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateLoading));

  @override
  _AddEditTaskPageStateLoading get _value =>
      super._value as _AddEditTaskPageStateLoading;
}

/// @nodoc

@Implements(BuildState)
class _$_AddEditTaskPageStateLoading implements _AddEditTaskPageStateLoading {
  const _$_AddEditTaskPageStateLoading();

  @override
  String toString() {
    return 'AddEditTaskPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AddEditTaskPageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
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
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateLoading
    implements AddEditTaskPageState, BuildState {
  const factory _AddEditTaskPageStateLoading() = _$_AddEditTaskPageStateLoading;
}

/// @nodoc
abstract class _$AddEditTaskPageStateInitialCopyWith<$Res> {
  factory _$AddEditTaskPageStateInitialCopyWith(
          _AddEditTaskPageStateInitial value,
          $Res Function(_AddEditTaskPageStateInitial) then) =
      __$AddEditTaskPageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddEditTaskPageStateInitialCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateInitialCopyWith<$Res> {
  __$AddEditTaskPageStateInitialCopyWithImpl(
      _AddEditTaskPageStateInitial _value,
      $Res Function(_AddEditTaskPageStateInitial) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateInitial));

  @override
  _AddEditTaskPageStateInitial get _value =>
      super._value as _AddEditTaskPageStateInitial;
}

/// @nodoc

@Implements(BuildState)
class _$_AddEditTaskPageStateInitial implements _AddEditTaskPageStateInitial {
  const _$_AddEditTaskPageStateInitial();

  @override
  String toString() {
    return 'AddEditTaskPageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AddEditTaskPageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
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
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateInitial
    implements AddEditTaskPageState, BuildState {
  const factory _AddEditTaskPageStateInitial() = _$_AddEditTaskPageStateInitial;
}

/// @nodoc
abstract class _$AddEditTaskPageStateIdleCopyWith<$Res> {
  factory _$AddEditTaskPageStateIdleCopyWith(_AddEditTaskPageStateIdle value,
          $Res Function(_AddEditTaskPageStateIdle) then) =
      __$AddEditTaskPageStateIdleCopyWithImpl<$Res>;
  $Res call({Set<TaskValid> errors});
}

/// @nodoc
class __$AddEditTaskPageStateIdleCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateIdleCopyWith<$Res> {
  __$AddEditTaskPageStateIdleCopyWithImpl(_AddEditTaskPageStateIdle _value,
      $Res Function(_AddEditTaskPageStateIdle) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateIdle));

  @override
  _AddEditTaskPageStateIdle get _value =>
      super._value as _AddEditTaskPageStateIdle;

  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_AddEditTaskPageStateIdle(
      errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Set<TaskValid>,
    ));
  }
}

/// @nodoc

@Implements(BuildState)
class _$_AddEditTaskPageStateIdle implements _AddEditTaskPageStateIdle {
  const _$_AddEditTaskPageStateIdle(this.errors);

  @override
  final Set<TaskValid> errors;

  @override
  String toString() {
    return 'AddEditTaskPageState.idle(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddEditTaskPageStateIdle &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errors);

  @JsonKey(ignore: true)
  @override
  _$AddEditTaskPageStateIdleCopyWith<_AddEditTaskPageStateIdle> get copyWith =>
      __$AddEditTaskPageStateIdleCopyWithImpl<_AddEditTaskPageStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return idle(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return idle?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateIdle
    implements AddEditTaskPageState, BuildState {
  const factory _AddEditTaskPageStateIdle(Set<TaskValid> errors) =
      _$_AddEditTaskPageStateIdle;

  Set<TaskValid> get errors => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddEditTaskPageStateIdleCopyWith<_AddEditTaskPageStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddEditTaskPageStateErrorCopyWith<$Res> {
  factory _$AddEditTaskPageStateErrorCopyWith(_AddEditTaskPageStateError value,
          $Res Function(_AddEditTaskPageStateError) then) =
      __$AddEditTaskPageStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddEditTaskPageStateErrorCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateErrorCopyWith<$Res> {
  __$AddEditTaskPageStateErrorCopyWithImpl(_AddEditTaskPageStateError _value,
      $Res Function(_AddEditTaskPageStateError) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateError));

  @override
  _AddEditTaskPageStateError get _value =>
      super._value as _AddEditTaskPageStateError;
}

/// @nodoc

class _$_AddEditTaskPageStateError implements _AddEditTaskPageStateError {
  const _$_AddEditTaskPageStateError();

  @override
  String toString() {
    return 'AddEditTaskPageState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AddEditTaskPageStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateError implements AddEditTaskPageState {
  const factory _AddEditTaskPageStateError() = _$_AddEditTaskPageStateError;
}

/// @nodoc
abstract class _$AddEditTaskPageStateAddingSuccessCopyWith<$Res> {
  factory _$AddEditTaskPageStateAddingSuccessCopyWith(
          _AddEditTaskPageStateAddingSuccess value,
          $Res Function(_AddEditTaskPageStateAddingSuccess) then) =
      __$AddEditTaskPageStateAddingSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddEditTaskPageStateAddingSuccessCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateAddingSuccessCopyWith<$Res> {
  __$AddEditTaskPageStateAddingSuccessCopyWithImpl(
      _AddEditTaskPageStateAddingSuccess _value,
      $Res Function(_AddEditTaskPageStateAddingSuccess) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateAddingSuccess));

  @override
  _AddEditTaskPageStateAddingSuccess get _value =>
      super._value as _AddEditTaskPageStateAddingSuccess;
}

/// @nodoc

class _$_AddEditTaskPageStateAddingSuccess
    implements _AddEditTaskPageStateAddingSuccess {
  const _$_AddEditTaskPageStateAddingSuccess();

  @override
  String toString() {
    return 'AddEditTaskPageState.addingSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddEditTaskPageStateAddingSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return addingSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return addingSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (addingSuccess != null) {
      return addingSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return addingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return addingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (addingSuccess != null) {
      return addingSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateAddingSuccess
    implements AddEditTaskPageState {
  const factory _AddEditTaskPageStateAddingSuccess() =
      _$_AddEditTaskPageStateAddingSuccess;
}

/// @nodoc
abstract class _$AddEditTaskPageStateEditingSuccessCopyWith<$Res> {
  factory _$AddEditTaskPageStateEditingSuccessCopyWith(
          _AddEditTaskPageStateEditingSuccess value,
          $Res Function(_AddEditTaskPageStateEditingSuccess) then) =
      __$AddEditTaskPageStateEditingSuccessCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$AddEditTaskPageStateEditingSuccessCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateEditingSuccessCopyWith<$Res> {
  __$AddEditTaskPageStateEditingSuccessCopyWithImpl(
      _AddEditTaskPageStateEditingSuccess _value,
      $Res Function(_AddEditTaskPageStateEditingSuccess) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateEditingSuccess));

  @override
  _AddEditTaskPageStateEditingSuccess get _value =>
      super._value as _AddEditTaskPageStateEditingSuccess;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_AddEditTaskPageStateEditingSuccess(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_AddEditTaskPageStateEditingSuccess
    implements _AddEditTaskPageStateEditingSuccess {
  const _$_AddEditTaskPageStateEditingSuccess(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'AddEditTaskPageState.editingSuccess(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddEditTaskPageStateEditingSuccess &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$AddEditTaskPageStateEditingSuccessCopyWith<
          _AddEditTaskPageStateEditingSuccess>
      get copyWith => __$AddEditTaskPageStateEditingSuccessCopyWithImpl<
          _AddEditTaskPageStateEditingSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return editingSuccess(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return editingSuccess?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (editingSuccess != null) {
      return editingSuccess(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return editingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return editingSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (editingSuccess != null) {
      return editingSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateEditingSuccess
    implements AddEditTaskPageState {
  const factory _AddEditTaskPageStateEditingSuccess(Task task) =
      _$_AddEditTaskPageStateEditingSuccess;

  Task get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddEditTaskPageStateEditingSuccessCopyWith<
          _AddEditTaskPageStateEditingSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddEditTaskPageStateConnectionErrorCopyWith<$Res> {
  factory _$AddEditTaskPageStateConnectionErrorCopyWith(
          _AddEditTaskPageStateConnectionError value,
          $Res Function(_AddEditTaskPageStateConnectionError) then) =
      __$AddEditTaskPageStateConnectionErrorCopyWithImpl<$Res>;
  $Res call({GeneralConnectionError error});

  $GeneralConnectionErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$AddEditTaskPageStateConnectionErrorCopyWithImpl<$Res>
    extends _$AddEditTaskPageStateCopyWithImpl<$Res>
    implements _$AddEditTaskPageStateConnectionErrorCopyWith<$Res> {
  __$AddEditTaskPageStateConnectionErrorCopyWithImpl(
      _AddEditTaskPageStateConnectionError _value,
      $Res Function(_AddEditTaskPageStateConnectionError) _then)
      : super(_value, (v) => _then(v as _AddEditTaskPageStateConnectionError));

  @override
  _AddEditTaskPageStateConnectionError get _value =>
      super._value as _AddEditTaskPageStateConnectionError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_AddEditTaskPageStateConnectionError(
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

class _$_AddEditTaskPageStateConnectionError
    implements _AddEditTaskPageStateConnectionError {
  const _$_AddEditTaskPageStateConnectionError(this.error);

  @override
  final GeneralConnectionError error;

  @override
  String toString() {
    return 'AddEditTaskPageState.connectionError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddEditTaskPageStateConnectionError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$AddEditTaskPageStateConnectionErrorCopyWith<
          _AddEditTaskPageStateConnectionError>
      get copyWith => __$AddEditTaskPageStateConnectionErrorCopyWithImpl<
          _AddEditTaskPageStateConnectionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(Set<TaskValid> errors) idle,
    required TResult Function() error,
    required TResult Function() addingSuccess,
    required TResult Function(Task task) editingSuccess,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return connectionError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return connectionError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(Set<TaskValid> errors)? idle,
    TResult Function()? error,
    TResult Function()? addingSuccess,
    TResult Function(Task task)? editingSuccess,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddEditTaskPageStateLoading value) loading,
    required TResult Function(_AddEditTaskPageStateInitial value) initial,
    required TResult Function(_AddEditTaskPageStateIdle value) idle,
    required TResult Function(_AddEditTaskPageStateError value) error,
    required TResult Function(_AddEditTaskPageStateAddingSuccess value)
        addingSuccess,
    required TResult Function(_AddEditTaskPageStateEditingSuccess value)
        editingSuccess,
    required TResult Function(_AddEditTaskPageStateConnectionError value)
        connectionError,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddEditTaskPageStateLoading value)? loading,
    TResult Function(_AddEditTaskPageStateInitial value)? initial,
    TResult Function(_AddEditTaskPageStateIdle value)? idle,
    TResult Function(_AddEditTaskPageStateError value)? error,
    TResult Function(_AddEditTaskPageStateAddingSuccess value)? addingSuccess,
    TResult Function(_AddEditTaskPageStateEditingSuccess value)? editingSuccess,
    TResult Function(_AddEditTaskPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class _AddEditTaskPageStateConnectionError
    implements AddEditTaskPageState {
  const factory _AddEditTaskPageStateConnectionError(
      GeneralConnectionError error) = _$_AddEditTaskPageStateConnectionError;

  GeneralConnectionError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddEditTaskPageStateConnectionErrorCopyWith<
          _AddEditTaskPageStateConnectionError>
      get copyWith => throw _privateConstructorUsedError;
}
