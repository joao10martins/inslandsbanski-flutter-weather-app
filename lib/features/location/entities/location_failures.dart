import 'package:weather_app/core/errors/failures.dart';

/// Describe the enterprise business rules or the business objects of the app, encapsulating the most general and high-level rules.
/// They are the least likely to change when there are external changes.
class PermissionDeniedFailure extends Failure {
  @override
  String getMessage() {
    return 'Location permissions are denied';
  }
}

class LocationServiceDisabledFailure extends Failure {
  @override
  String getMessage() {
    return 'Location services are disabled.';
  }
}
