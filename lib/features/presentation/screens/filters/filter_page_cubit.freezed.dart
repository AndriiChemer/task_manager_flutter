// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterPageStateTearOff {
  const _$FilterPageStateTearOff();

  _FilterPageStateLoading loading() {
    return const _FilterPageStateLoading();
  }

  _FilterPageStateIdle idle(FiltersModel filtersModel) {
    return _FilterPageStateIdle(
      filtersModel,
    );
  }
}

/// @nodoc
const $FilterPageState = _$FilterPageStateTearOff();

/// @nodoc
mixin _$FilterPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FiltersModel filtersModel) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterPageStateLoading value) loading,
    required TResult Function(_FilterPageStateIdle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterPageStateCopyWith<$Res> {
  factory $FilterPageStateCopyWith(
          FilterPageState value, $Res Function(FilterPageState) then) =
      _$FilterPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FilterPageStateCopyWithImpl<$Res>
    implements $FilterPageStateCopyWith<$Res> {
  _$FilterPageStateCopyWithImpl(this._value, this._then);

  final FilterPageState _value;
  // ignore: unused_field
  final $Res Function(FilterPageState) _then;
}

/// @nodoc
abstract class _$FilterPageStateLoadingCopyWith<$Res> {
  factory _$FilterPageStateLoadingCopyWith(_FilterPageStateLoading value,
          $Res Function(_FilterPageStateLoading) then) =
      __$FilterPageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$FilterPageStateLoadingCopyWithImpl<$Res>
    extends _$FilterPageStateCopyWithImpl<$Res>
    implements _$FilterPageStateLoadingCopyWith<$Res> {
  __$FilterPageStateLoadingCopyWithImpl(_FilterPageStateLoading _value,
      $Res Function(_FilterPageStateLoading) _then)
      : super(_value, (v) => _then(v as _FilterPageStateLoading));

  @override
  _FilterPageStateLoading get _value => super._value as _FilterPageStateLoading;
}

/// @nodoc

@Implements(BuildState)
class _$_FilterPageStateLoading implements _FilterPageStateLoading {
  const _$_FilterPageStateLoading();

  @override
  String toString() {
    return 'FilterPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FilterPageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FiltersModel filtersModel) idle,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
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
    required TResult Function(_FilterPageStateLoading value) loading,
    required TResult Function(_FilterPageStateIdle value) idle,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _FilterPageStateLoading implements FilterPageState, BuildState {
  const factory _FilterPageStateLoading() = _$_FilterPageStateLoading;
}

/// @nodoc
abstract class _$FilterPageStateIdleCopyWith<$Res> {
  factory _$FilterPageStateIdleCopyWith(_FilterPageStateIdle value,
          $Res Function(_FilterPageStateIdle) then) =
      __$FilterPageStateIdleCopyWithImpl<$Res>;
  $Res call({FiltersModel filtersModel});
}

/// @nodoc
class __$FilterPageStateIdleCopyWithImpl<$Res>
    extends _$FilterPageStateCopyWithImpl<$Res>
    implements _$FilterPageStateIdleCopyWith<$Res> {
  __$FilterPageStateIdleCopyWithImpl(
      _FilterPageStateIdle _value, $Res Function(_FilterPageStateIdle) _then)
      : super(_value, (v) => _then(v as _FilterPageStateIdle));

  @override
  _FilterPageStateIdle get _value => super._value as _FilterPageStateIdle;

  @override
  $Res call({
    Object? filtersModel = freezed,
  }) {
    return _then(_FilterPageStateIdle(
      filtersModel == freezed
          ? _value.filtersModel
          : filtersModel // ignore: cast_nullable_to_non_nullable
              as FiltersModel,
    ));
  }
}

/// @nodoc

@Implements(BuildState)
class _$_FilterPageStateIdle implements _FilterPageStateIdle {
  const _$_FilterPageStateIdle(this.filtersModel);

  @override
  final FiltersModel filtersModel;

  @override
  String toString() {
    return 'FilterPageState.idle(filtersModel: $filtersModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilterPageStateIdle &&
            (identical(other.filtersModel, filtersModel) ||
                const DeepCollectionEquality()
                    .equals(other.filtersModel, filtersModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filtersModel);

  @JsonKey(ignore: true)
  @override
  _$FilterPageStateIdleCopyWith<_FilterPageStateIdle> get copyWith =>
      __$FilterPageStateIdleCopyWithImpl<_FilterPageStateIdle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FiltersModel filtersModel) idle,
  }) {
    return idle(filtersModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
  }) {
    return idle?.call(filtersModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FiltersModel filtersModel)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(filtersModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilterPageStateLoading value) loading,
    required TResult Function(_FilterPageStateIdle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilterPageStateLoading value)? loading,
    TResult Function(_FilterPageStateIdle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _FilterPageStateIdle implements FilterPageState, BuildState {
  const factory _FilterPageStateIdle(FiltersModel filtersModel) =
      _$_FilterPageStateIdle;

  FiltersModel get filtersModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FilterPageStateIdleCopyWith<_FilterPageStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}
