import 'package:flutter/material.dart';
import 'package:note_app/common_button.dart';
import 'package:note_app/essential/color.dart';
import 'package:note_app/essential/constants.dart';
import 'package:note_app/essential/helper.dart';
import 'package:note_app/essential/style.dart';
import 'package:note_app/rich_text.dart';

class SignupScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    create,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    account,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichTextFormatter(
                    content: login,
                    title: alreadyHaveAnAccount,
                    onTap: () {
                      Navigator.pop(
                        context,
                        _emailController,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    cursorColor: lightTextColor,
                    validator: (value) => value!.isEmpty ? requiredValue : null,
                    decoration: decoration(context, name),
                  ),
                  const SizedBox(
                    height: 16.0,
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
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isPasswordVisible,
                    cursorColor: lightTextColor,
                    validator: (value) => value!.isEmpty
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
                    height: 24.0,
                  ),
                  CommonButton(
                      buttonName: submit,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {}
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
