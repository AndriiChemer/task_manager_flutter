// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginationTearOff {
  const _$PaginationTearOff();

  _Pagination call(
      {required int current, required int limit, required int count}) {
    return _Pagination(
      current: current,
      limit: limit,
      count: count,
    );
  }
}

/// @nodoc
const $Pagination = _$PaginationTearOff();

/// @nodoc
mixin _$Pagination {
  int get current => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res>;
  $Res call({int current, int limit, int count});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  final Pagination _value;
  // ignore: unused_field
  final $Res Function(Pagination) _then;

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
abstract class _$PaginationCopyWith<$Res> implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(
          _Pagination value, $Res Function(_Pagination) then) =
      __$PaginationCopyWithImpl<$Res>;
  @override
  $Res call({int current, int limit, int count});
}

/// @nodoc
class __$PaginationCopyWithImpl<$Res> extends _$PaginationCopyWithImpl<$Res>
    implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(
      _Pagination _value, $Res Function(_Pagination) _then)
      : super(_value, (v) => _then(v as _Pagination));

  @override
  _Pagination get _value => super._value as _Pagination;

  @override
  $Res call({
    Object? current = freezed,
    Object? limit = freezed,
    Object? count = freezed,
  }) {
    return _then(_Pagination(
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

class _$_Pagination extends _Pagination {
  _$_Pagination(
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
    return 'Pagination(current: $current, limit: $limit, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pagination &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, limit, count);

  @JsonKey(ignore: true)
  @override
  _$PaginationCopyWith<_Pagination> get copyWith =>
      __$PaginationCopyWithImpl<_Pagination>(this, _$identity);
}

abstract class _Pagination extends Pagination {
  factory _Pagination(
      {required int current,
      required int limit,
      required int count}) = _$_Pagination;
  _Pagination._() : super._();

  @override
  int get current;
  @override
  int get limit;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$PaginationCopyWith<_Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}
