// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskModelTearOff {
  const _$TaskModelTearOff();

  _TaskModel call(
      {int? id,
      required String title,
      required int dueBy,
      required String priority}) {
    return _TaskModel(
      id: id,
      title: title,
      dueBy: dueBy,
      priority: priority,
    );
  }
}

/// @nodoc
const $TaskModel = _$TaskModelTearOff();

/// @nodoc
mixin _$TaskModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get dueBy => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res>;
  $Res call({int? id, String title, int dueBy, String priority});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  final TaskModel _value;
  // ignore: unused_field
  final $Res Function(TaskModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? dueBy = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueBy: dueBy == freezed
          ? _value.dueBy
          : dueBy // ignore: cast_nullable_to_non_nullable
              as int,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
          _TaskModel value, $Res Function(_TaskModel) then) =
      __$TaskModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String title, int dueBy, String priority});
}

/// @nodoc
class __$TaskModelCopyWithImpl<$Res> extends _$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(_TaskModel _value, $Res Function(_TaskModel) _then)
      : super(_value, (v) => _then(v as _TaskModel));

  @override
  _TaskModel get _value => super._value as _TaskModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? dueBy = freezed,
    Object? priority = freezed,
  }) {
    return _then(_TaskModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueBy: dueBy == freezed
          ? _value.dueBy
          : dueBy // ignore: cast_nullable_to_non_nullable
              as int,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TaskModel extends _TaskModel {
  _$_TaskModel(
      {this.id,
      required this.title,
      required this.dueBy,
      required this.priority})
      : super._();

  @override
  final int? id;
  @override
  final String title;
  @override
  final int dueBy;
  @override
  final String priority;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, dueBy: $dueBy, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueBy, dueBy) || other.dueBy == dueBy) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, dueBy, priority);

  @JsonKey(ignore: true)
  @override
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);
}

abstract class _TaskModel extends TaskModel {
  factory _TaskModel(
      {int? id,
      required String title,
      required int dueBy,
      required String priority}) = _$_TaskModel;
  _TaskModel._() : super._();

  @override
  int? get id;
  @override
  String get title;
  @override
  int get dueBy;
  @override
  String get priority;
  @override
  @JsonKey(ignore: true)
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
