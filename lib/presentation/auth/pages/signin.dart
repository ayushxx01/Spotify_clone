import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rockify/common/Widgets/appbar/basic_app_bar.dart';
import 'package:rockify/common/Widgets/button/basic_app_button.dart';
import 'package:rockify/core/configs/assets/app_vectors.dart';
import 'package:rockify/data/models/auth/signin_user_req.dart';
import 'package:rockify/domain/usecases/auth/signin.dart';

import 'package:rockify/presentation/auth/pages/singup.dart';
import 'package:rockify/presentation/home/pages/home.dart';
import 'package:rockify/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 85),
        child: _signUpText(context),
      ),
      appBar: BasicAppBar(
          title: SvgPicture.asset(
        AppVectors.logo,
        height: 40,
        width: 40,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
          child: Center(
            child: Column(
              children: [
                _registerText(),
                const SizedBox(height: 50),
                _emailField(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 20),
                BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SignInUseCase>().call(
                        params: SigninUserReq(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        ),
                      );
                      result.fold((l) {
                        var snackbar = SnackBar(
                          content: Text(
                            'Error: $l',
                            style: const TextStyle(color: Colors.red),
                          ),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }, (r) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                      });
                    },
                    title: 'Sign In'),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'Enter Email',
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
        controller: _passwordController,
        decoration: const InputDecoration(
          hintText: 'Password',
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          const Text(
            'Not a Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage()));
            },
            child: const Text(
              'Register Now',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
