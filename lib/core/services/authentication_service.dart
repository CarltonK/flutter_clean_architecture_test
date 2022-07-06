import 'package:flutter_clean_architecture_test/core/core.dart';
import 'package:flutter_clean_architecture_test/locator.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    // ignore: unnecessary_null_comparison
    var hasUser = fetchedUser != null;

    return hasUser;
  }
}
