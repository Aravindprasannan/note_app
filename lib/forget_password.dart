import 'package:flutter/material.dart';
import 'package:note_app/common_button.dart';
import 'package:note_app/essential/constants.dart';
import 'package:note_app/rich_text.dart';

import 'essential/color.dart';
import 'essential/helper.dart';
import 'essential/style.dart';

class ForgetPassword extends StatefulWidget {
  static route(String email) => MaterialPageRoute(
        builder: (context) => ForgetPassword(
          email: email,
        ),
      );

  const ForgetPassword({required this.email, super.key});

  final String email;

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.email);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      forgetPassword,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 42.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: lightTextColor,
                      validator: (value) => value!.isEmpty
                          ? requiredValue
                          : !emailValid(value)
                              ? invalidEmail
                              : null,
                      decoration: decoration(context, email),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichTextFormatter(
                        content: clickHere,
                        title: backToLoginScreen,
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      height: 32.0,
                    ),
                    CommonButton(
                        buttonName: submit,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {}
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
