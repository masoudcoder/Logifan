import 'package:flutter/material.dart';

/// When there is no functionality for a given action eg. noOp
void doNothing([dynamic]) {}

/// Use this when you just want to track which places to implement later
@Deprecated('Implement your own code here')
void notImplemented({String? message}) {
  debugPrint(message ?? 'Not implemented functionality');
}

/// Uses this when you want to inform yourself about important functionality to be implemented
@Deprecated('Implement your own code here')
void shouldImplement({String? message}) {
  throw Exception(message ?? 'This should be implemented');
}

/// Run your operation with Kotlin run equivalent
T run<T>(T Function() operation) => operation();

/// Runtime exception when an error occurs
dynamic error([message]) {
  throw (message ?? 'Exception');
}