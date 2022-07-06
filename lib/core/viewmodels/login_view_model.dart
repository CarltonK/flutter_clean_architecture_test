import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_test/core/core.dart';
import 'package:flutter_clean_architecture_test/locator.dart';

// ignore: constant_identifier_names
enum ViewState { Idle, Busy }

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userId) async {
    setState(ViewState.Busy);

    var uId = int.tryParse(userId);
    var success = await _authenticationService.login(uId!);

    setState(ViewState.Busy);
    return success;
  }
}
