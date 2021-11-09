import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef _InternalObserver = void Function(AppLifecycleState currentAppState, AppLifecycleState previousAppState);

typedef AppLifecycleListener = void Function(
    AppLifecycleState currentAppState, AppLifecycleState previousAppState, BuildContext context);

void useAppLifecycleStateListener(AppLifecycleListener listener, {BuildContext? context}) {
  useEffect(() {
    final hookContext = useContext();
    final internalCallback =
        (AppLifecycleState state, AppLifecycleState prev) => listener(state, prev, context ?? hookContext);

    final observer = _AppLifecycleStateObserver(internalCallback);
  });
}

class _AppLifecycleStateObserver extends WidgetsBindingObserver {
  final _InternalObserver _listener;
  AppLifecycleState? _previousState;

  _AppLifecycleStateObserver(this._listener);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _listener(
      state,
      _previousState ?? state
    );
    _previousState = state;
  }
}

