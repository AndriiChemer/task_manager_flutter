// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginationModelTearOff {
  const _$PaginationModelTearOff();

  _PaginationModel call(
      {required int current, required int limit, required int count}) {
    return _PaginationModel(
      current: current,
      limit: limit,
      count: count,
    );
  }
}

/// @nodoc
const $PaginationModel = _$PaginationModelTearOff();

/// @nodoc
mixin _$PaginationModel {
  int get current => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res>;
  $Res call({int current, int limit, int count});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  final PaginationModel _value;
  // ignore: unused_field
  final $Res Function(PaginationModel) _then;

  @override
  $Res call({
    Object? current = freezed,
    Object? limit = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationModelCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$PaginationModelCopyWith(
          _PaginationModel value, $Res Function(_PaginationModel) then) =
      __$PaginationModelCopyWithImpl<$Res>;
  @override
  $Res call({int current, int limit, int count});
}

/// @nodoc
class __$PaginationModelCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res>
    implements _$PaginationModelCopyWith<$Res> {
  __$PaginationModelCopyWithImpl(
      _PaginationModel _value, $Res Function(_PaginationModel) _then)
      : super(_value, (v) => _then(v as _PaginationModel));

  @override
  _PaginationModel get _value => super._value as _PaginationModel;

  @override
  $Res call({
    Object? current = freezed,
    Object? limit = freezed,
    Object? count = freezed,
  }) {
    return _then(_PaginationModel(
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PaginationModel extends _PaginationModel {
  _$_PaginationModel(
      {required this.current, required this.limit, required this.count})
      : super._();

  @override
  final int current;
  @override
  final int limit;
  @override
  final int count;

  @override
  String toString() {
    return 'PaginationModel(current: $current, limit: $limit, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationModel &&
            (identical(other.current, current) ||
                const DeepCollectionEquality()
                    .equals(other.current, current)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(current) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$PaginationModelCopyWith<_PaginationModel> get copyWith =>
      __$PaginationModelCopyWithImpl<_PaginationModel>(this, _$identity);
}

abstract class _PaginationModel extends PaginationModel {
  factory _PaginationModel(
      {required int current,
      required int limit,
      required int count}) = _$_PaginationModel;
  _PaginationModel._() : super._();

  @override
  int get current => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationModelCopyWith<_PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
