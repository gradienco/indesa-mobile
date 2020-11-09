import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indesa_beta/router/router_generator.dart';

class LoginBloc {
  final _stateStreamController = StreamController<Map<String, dynamic>>();
  StreamSink<Map<String, dynamic>> get loginSink => _stateStreamController.sink;
  Stream<Map<String, dynamic>> get loginStream => _stateStreamController.stream;

  // final _eventStreamController = StreamController();
  // StreamSink get eventSink => _eventStreamController.sink;
  // Stream get _eventStream => _eventStreamController.stream;

  LoginBloc(){
    loginStream.listen((event) {
      print(event['username']);
      print(event['password']);
      BuildContext ctx = event['context'];
      Navigator.pushReplacementNamed(ctx, RouterGenerator.routeDashboard);
    });
  }
}