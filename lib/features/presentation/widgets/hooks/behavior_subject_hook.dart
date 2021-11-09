import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<T> useBehaviorSubject<T>({
  T? value,
  void Function()? onListen,
  void Function()? onCancel,
  bool sync = false,
  List? keys,
}) {
  return use(_BehaviorSubjectHook(
    value: value,
    keys: keys,
    onCancel: onCancel,
    onListen: onListen,
  ));
}


class _BehaviorSubjectHook<T> extends Hook<BehaviorSubject<T>> {

  final T? value;
  final bool sync;
  final Function()? onListen;
  final Function()? onCancel;

  const _BehaviorSubjectHook({
    required this.value,
    this.sync = false,
    required this.onListen,
    required this.onCancel,
    List? keys,
  }) : super(keys: keys);

  @override
  HookState<BehaviorSubject<T>, Hook<BehaviorSubject<T>>> createState() =>
      _BehaviorSubjectHookState<T>();

}

class _BehaviorSubjectHookState<T>
    extends HookState<BehaviorSubject<T>, _BehaviorSubjectHook<T>> {

  late BehaviorSubject<T> _behaviorSubject;

  @override
  void didUpdateHook(_BehaviorSubjectHook<T> oldHook) {
    super.didUpdateHook(oldHook);
    if (oldHook.onListen != hook.onListen) {
      _behaviorSubject.onListen = hook.onListen;
    }
    if (oldHook.onCancel != hook.onCancel) {
      _behaviorSubject.onCancel = hook.onCancel;
    }
    if (hook.value != oldHook.value && hook.value != null) {
      _behaviorSubject.value = hook.value!;
    }
  }

  @override
  void initHook() {
    super.initHook();

    if(hook.value == null) {
      _behaviorSubject = BehaviorSubject<T>(
        sync: hook.sync,
        onCancel: hook.onCancel,
        onListen: hook.onListen,
      );
    } else {
      _behaviorSubject = BehaviorSubject.seeded(
        hook.value!,
        sync: hook.sync,
        onCancel: hook.onCancel,
        onListen: hook.onListen,
      );
    }

  }

  @override
  BehaviorSubject<T> build(BuildContext context) => _behaviorSubject;

  @override
  void dispose() {
    _behaviorSubject.close();
  }

}
