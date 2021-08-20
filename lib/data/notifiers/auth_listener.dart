import 'dart:async';

class AuthListener {
  StreamController<bool> _authStreamController = StreamController<bool>.broadcast();

  Stream<bool> get authStream => _authStreamController.stream;

  setUserAuthorization(bool isAuthorized) => _authStreamController.sink.add(isAuthorized);

  authListenerDispose() => _authStreamController.close();
}