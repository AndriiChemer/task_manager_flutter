import 'dart:async';

import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteTaskNotifier {
  final StreamController<int> _streamController = StreamController.broadcast();

  void notify(int id) => _streamController.sink.add(id);

  Stream<int> listen() => _streamController.stream;
}