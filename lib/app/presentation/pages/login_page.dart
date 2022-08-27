import 'package:example_app/app/presentation/components/application_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void login() {
      Modular.to.pushReplacementNamed('/');
    }

    void register() {
      Modular.to.pushNamed('/register');
    }

    return Scaffold(
      appBar: const ApplicationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
              ),
              onPressed: login,
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
              ),
              onPressed: register,
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
