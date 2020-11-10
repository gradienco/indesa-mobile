import 'dart:async';

enum Status {
  loading,
  success,
  failure,
}
class ProvinsiBloc{

  final streamController = StreamController<Status>();
  Stream<Status> get stream => streamController.stream;
  StreamSink<Status> get sink => streamController.sink;

}