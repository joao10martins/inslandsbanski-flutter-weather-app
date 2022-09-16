import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String getMessage();
}

class ServerFailure extends Failure {
  ServerFailure({this.statusCode, this.errorMessage, this.reason});

  final int? statusCode;
  final String? errorMessage;
  final String? reason;

  @override
  String getMessage() {
    if (errorMessage != null) {
      return errorMessage!;
    }
    return 'Server failure ($statusCode), while calling $reason';
  }
}

class ClientFailure extends Failure {
  ClientFailure(this.exception, {this.reason});

  final dynamic exception;
  final String? reason;

  @override
  String getMessage() {
    return 'Client failure: ${exception.toString()}';
  }
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure();

  @override
  String getMessage() {
    return 'No internet connection';
  }
}
