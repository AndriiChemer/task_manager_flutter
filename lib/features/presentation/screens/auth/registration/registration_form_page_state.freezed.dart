// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registration_form_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegistrationFormPageStateTearOff {
  const _$RegistrationFormPageStateTearOff();

  _RegistrationFormPageStateInitial initial() {
    return _RegistrationFormPageStateInitial();
  }

  _RegistrationFormPageStateIdle idle(Set<RegistrationFormPageError> errors) {
    return _RegistrationFormPageStateIdle(
      errors,
    );
  }

  _RegistrationFormPageStateProcessing processing() {
    return _RegistrationFormPageStateProcessing();
  }

  _RegistrationFormPageStateError error() {
    return _RegistrationFormPageStateError();
  }

  _RegistrationFormPageStateSuccess success() {
    return _RegistrationFormPageStateSuccess();
  }

  _RegistrationFormPageStateConnectionError connectionError(
      GeneralConnectionError error) {
    return _RegistrationFormPageStateConnectionError(
      error,
    );
  }
}

/// @nodoc
const $RegistrationFormPageState = _$RegistrationFormPageStateTearOff();

/// @nodoc
mixin _$RegistrationFormPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationFormPageStateCopyWith<$Res> {
  factory $RegistrationFormPageStateCopyWith(RegistrationFormPageState value,
          $Res Function(RegistrationFormPageState) then) =
      _$RegistrationFormPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements $RegistrationFormPageStateCopyWith<$Res> {
  _$RegistrationFormPageStateCopyWithImpl(this._value, this._then);

  final RegistrationFormPageState _value;
  // ignore: unused_field
  final $Res Function(RegistrationFormPageState) _then;
}

/// @nodoc
abstract class _$RegistrationFormPageStateInitialCopyWith<$Res> {
  factory _$RegistrationFormPageStateInitialCopyWith(
          _RegistrationFormPageStateInitial value,
          $Res Function(_RegistrationFormPageStateInitial) then) =
      __$RegistrationFormPageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegistrationFormPageStateInitialCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateInitialCopyWith<$Res> {
  __$RegistrationFormPageStateInitialCopyWithImpl(
      _RegistrationFormPageStateInitial _value,
      $Res Function(_RegistrationFormPageStateInitial) _then)
      : super(_value, (v) => _then(v as _RegistrationFormPageStateInitial));

  @override
  _RegistrationFormPageStateInitial get _value =>
      super._value as _RegistrationFormPageStateInitial;
}

/// @nodoc

@Implements(BuildState)
class _$_RegistrationFormPageStateInitial
    implements _RegistrationFormPageStateInitial {
  _$_RegistrationFormPageStateInitial();

  @override
  String toString() {
    return 'RegistrationFormPageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationFormPageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
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
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateInitial
    implements RegistrationFormPageState, BuildState {
  factory _RegistrationFormPageStateInitial() =
      _$_RegistrationFormPageStateInitial;
}

/// @nodoc
abstract class _$RegistrationFormPageStateIdleCopyWith<$Res> {
  factory _$RegistrationFormPageStateIdleCopyWith(
          _RegistrationFormPageStateIdle value,
          $Res Function(_RegistrationFormPageStateIdle) then) =
      __$RegistrationFormPageStateIdleCopyWithImpl<$Res>;
  $Res call({Set<RegistrationFormPageError> errors});
}

/// @nodoc
class __$RegistrationFormPageStateIdleCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateIdleCopyWith<$Res> {
  __$RegistrationFormPageStateIdleCopyWithImpl(
      _RegistrationFormPageStateIdle _value,
      $Res Function(_RegistrationFormPageStateIdle) _then)
      : super(_value, (v) => _then(v as _RegistrationFormPageStateIdle));

  @override
  _RegistrationFormPageStateIdle get _value =>
      super._value as _RegistrationFormPageStateIdle;

  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_RegistrationFormPageStateIdle(
      errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Set<RegistrationFormPageError>,
    ));
  }
}

/// @nodoc

@Implements(BuildState)
class _$_RegistrationFormPageStateIdle
    implements _RegistrationFormPageStateIdle {
  _$_RegistrationFormPageStateIdle(this.errors);

  @override
  final Set<RegistrationFormPageError> errors;

  @override
  String toString() {
    return 'RegistrationFormPageState.idle(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationFormPageStateIdle &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errors);

  @JsonKey(ignore: true)
  @override
  _$RegistrationFormPageStateIdleCopyWith<_RegistrationFormPageStateIdle>
      get copyWith => __$RegistrationFormPageStateIdleCopyWithImpl<
          _RegistrationFormPageStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return idle(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return idle?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
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
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateIdle
    implements RegistrationFormPageState, BuildState {
  factory _RegistrationFormPageStateIdle(
      Set<RegistrationFormPageError> errors) = _$_RegistrationFormPageStateIdle;

  Set<RegistrationFormPageError> get errors =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RegistrationFormPageStateIdleCopyWith<_RegistrationFormPageStateIdle>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RegistrationFormPageStateProcessingCopyWith<$Res> {
  factory _$RegistrationFormPageStateProcessingCopyWith(
          _RegistrationFormPageStateProcessing value,
          $Res Function(_RegistrationFormPageStateProcessing) then) =
      __$RegistrationFormPageStateProcessingCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegistrationFormPageStateProcessingCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateProcessingCopyWith<$Res> {
  __$RegistrationFormPageStateProcessingCopyWithImpl(
      _RegistrationFormPageStateProcessing _value,
      $Res Function(_RegistrationFormPageStateProcessing) _then)
      : super(_value, (v) => _then(v as _RegistrationFormPageStateProcessing));

  @override
  _RegistrationFormPageStateProcessing get _value =>
      super._value as _RegistrationFormPageStateProcessing;
}

/// @nodoc

@Implements(BuildState)
class _$_RegistrationFormPageStateProcessing
    implements _RegistrationFormPageStateProcessing {
  _$_RegistrationFormPageStateProcessing();

  @override
  String toString() {
    return 'RegistrationFormPageState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationFormPageStateProcessing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateProcessing
    implements RegistrationFormPageState, BuildState {
  factory _RegistrationFormPageStateProcessing() =
      _$_RegistrationFormPageStateProcessing;
}

/// @nodoc
abstract class _$RegistrationFormPageStateErrorCopyWith<$Res> {
  factory _$RegistrationFormPageStateErrorCopyWith(
          _RegistrationFormPageStateError value,
          $Res Function(_RegistrationFormPageStateError) then) =
      __$RegistrationFormPageStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegistrationFormPageStateErrorCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateErrorCopyWith<$Res> {
  __$RegistrationFormPageStateErrorCopyWithImpl(
      _RegistrationFormPageStateError _value,
      $Res Function(_RegistrationFormPageStateError) _then)
      : super(_value, (v) => _then(v as _RegistrationFormPageStateError));

  @override
  _RegistrationFormPageStateError get _value =>
      super._value as _RegistrationFormPageStateError;
}

/// @nodoc

class _$_RegistrationFormPageStateError
    implements _RegistrationFormPageStateError {
  _$_RegistrationFormPageStateError();

  @override
  String toString() {
    return 'RegistrationFormPageState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RegistrationFormPageStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
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
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateError
    implements RegistrationFormPageState {
  factory _RegistrationFormPageStateError() = _$_RegistrationFormPageStateError;
}

/// @nodoc
abstract class _$RegistrationFormPageStateSuccessCopyWith<$Res> {
  factory _$RegistrationFormPageStateSuccessCopyWith(
          _RegistrationFormPageStateSuccess value,
          $Res Function(_RegistrationFormPageStateSuccess) then) =
      __$RegistrationFormPageStateSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegistrationFormPageStateSuccessCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateSuccessCopyWith<$Res> {
  __$RegistrationFormPageStateSuccessCopyWithImpl(
      _RegistrationFormPageStateSuccess _value,
      $Res Function(_RegistrationFormPageStateSuccess) _then)
      : super(_value, (v) => _then(v as _RegistrationFormPageStateSuccess));

  @override
  _RegistrationFormPageStateSuccess get _value =>
      super._value as _RegistrationFormPageStateSuccess;
}

/// @nodoc

class _$_RegistrationFormPageStateSuccess
    implements _RegistrationFormPageStateSuccess {
  _$_RegistrationFormPageStateSuccess();

  @override
  String toString() {
    return 'RegistrationFormPageState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationFormPageStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateSuccess
    implements RegistrationFormPageState {
  factory _RegistrationFormPageStateSuccess() =
      _$_RegistrationFormPageStateSuccess;
}

/// @nodoc
abstract class _$RegistrationFormPageStateConnectionErrorCopyWith<$Res> {
  factory _$RegistrationFormPageStateConnectionErrorCopyWith(
          _RegistrationFormPageStateConnectionError value,
          $Res Function(_RegistrationFormPageStateConnectionError) then) =
      __$RegistrationFormPageStateConnectionErrorCopyWithImpl<$Res>;
  $Res call({GeneralConnectionError error});

  $GeneralConnectionErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$RegistrationFormPageStateConnectionErrorCopyWithImpl<$Res>
    extends _$RegistrationFormPageStateCopyWithImpl<$Res>
    implements _$RegistrationFormPageStateConnectionErrorCopyWith<$Res> {
  __$RegistrationFormPageStateConnectionErrorCopyWithImpl(
      _RegistrationFormPageStateConnectionError _value,
      $Res Function(_RegistrationFormPageStateConnectionError) _then)
      : super(_value,
            (v) => _then(v as _RegistrationFormPageStateConnectionError));

  @override
  _RegistrationFormPageStateConnectionError get _value =>
      super._value as _RegistrationFormPageStateConnectionError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_RegistrationFormPageStateConnectionError(
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

class _$_RegistrationFormPageStateConnectionError
    implements _RegistrationFormPageStateConnectionError {
  _$_RegistrationFormPageStateConnectionError(this.error);

  @override
  final GeneralConnectionError error;

  @override
  String toString() {
    return 'RegistrationFormPageState.connectionError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationFormPageStateConnectionError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$RegistrationFormPageStateConnectionErrorCopyWith<
          _RegistrationFormPageStateConnectionError>
      get copyWith => __$RegistrationFormPageStateConnectionErrorCopyWithImpl<
          _RegistrationFormPageStateConnectionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Set<RegistrationFormPageError> errors) idle,
    required TResult Function() processing,
    required TResult Function() error,
    required TResult Function() success,
    required TResult Function(GeneralConnectionError error) connectionError,
  }) {
    return connectionError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
    TResult Function(GeneralConnectionError error)? connectionError,
  }) {
    return connectionError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Set<RegistrationFormPageError> errors)? idle,
    TResult Function()? processing,
    TResult Function()? error,
    TResult Function()? success,
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
    required TResult Function(_RegistrationFormPageStateInitial value) initial,
    required TResult Function(_RegistrationFormPageStateIdle value) idle,
    required TResult Function(_RegistrationFormPageStateProcessing value)
        processing,
    required TResult Function(_RegistrationFormPageStateError value) error,
    required TResult Function(_RegistrationFormPageStateSuccess value) success,
    required TResult Function(_RegistrationFormPageStateConnectionError value)
        connectionError,
  }) {
    return connectionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
  }) {
    return connectionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegistrationFormPageStateInitial value)? initial,
    TResult Function(_RegistrationFormPageStateIdle value)? idle,
    TResult Function(_RegistrationFormPageStateProcessing value)? processing,
    TResult Function(_RegistrationFormPageStateError value)? error,
    TResult Function(_RegistrationFormPageStateSuccess value)? success,
    TResult Function(_RegistrationFormPageStateConnectionError value)?
        connectionError,
    required TResult orElse(),
  }) {
    if (connectionError != null) {
      return connectionError(this);
    }
    return orElse();
  }
}

abstract class _RegistrationFormPageStateConnectionError
    implements RegistrationFormPageState {
  factory _RegistrationFormPageStateConnectionError(
          GeneralConnectionError error) =
      _$_RegistrationFormPageStateConnectionError;

  GeneralConnectionError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$RegistrationFormPageStateConnectionErrorCopyWith<
          _RegistrationFormPageStateConnectionError>
      get copyWith => throw _privateConstructorUsedError;
}
