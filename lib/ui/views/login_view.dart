import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_test/core/core.dart';
import 'package:flutter_clean_architecture_test/locator.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, value, child) {
          return Scaffold(
            body: Column(
              children: [
                value.state == ViewState.Busy
                    ? const CircularProgressIndicator(color: Colors.black)
                    : TextButton(
                        onPressed: () async {
                          var loginSuccess = await value.login('123456');
                          if (loginSuccess) {}
                        },
                        child: const Text('Login'),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
