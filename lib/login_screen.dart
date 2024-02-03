import 'package:flutter/material.dart';
import 'package:note_app/forget_password.dart';
import 'package:note_app/rich_text.dart';
import 'package:note_app/signup_screen.dart';

import 'common_button.dart';
import 'essential/color.dart';
import 'essential/constants.dart';
import 'essential/helper.dart';
import 'essential/style.dart';

class LoginScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );

  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hey, style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(loginHere,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge),
                      const SizedBox(height: 10.0),
                      RichTextFormatter(
                          content: signUp,
                          title: haveAccount,
                          onTap: () async {
                            final res = await Navigator.of(context).push(
                              SignupScreen.route(),
                            );
                            if (res != null) {
                              setState(
                                    () {
                                  _emailController.text = res.toString();
                                },
                              );
                            }
                          }),
                      const SizedBox(
                        height: 32.0,
                      ),
                      TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: lightTextColor,
                          validator: (value) =>
                          value!.isEmpty
                              ? requiredValue
                              : !emailValid(value)
                              ? invalidEmail
                              : null,
                          decoration: decoration(context, email)),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_isPasswordVisible,
                        cursorColor: lightTextColor,
                        validator: (value) =>
                        value!.isEmpty
                            ? requiredValue
                            : value.length < 8
                            ? passwordLength
                            : null,
                        decoration: decoration(context, password).copyWith(
                          suffixIconColor: lightTextColor,
                          suffixIcon: IconButton(
                            icon: !_isPasswordVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RichTextFormatter(
                        content: clickHere,
                        title: forgetPassword,
                        onTap: () {
                          Navigator.of(context).push(
                            ForgetPassword.route(_emailController.text),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CommonButton(
                          buttonName: login,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {}
                          }),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
