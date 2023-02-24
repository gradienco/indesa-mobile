import 'dart:async';

enum Status {
  initial,
  loading,
}

class LoginBloc {
  final _stateStreamController = StreamController<Status>();
  StreamSink<Status> get loginSink => _stateStreamController.sink;
  Stream<Status> get loginStream => _stateStreamController.stream;

  // final _eventStreamController = StreamController();
  // StreamSink get eventSink => _eventStreamController.sink;
  // Stream get _eventStream => _eventStreamController.stream;
}
