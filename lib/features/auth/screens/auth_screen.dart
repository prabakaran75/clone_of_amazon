import 'package:clone_of_amazon/common/widgets/custom_button.dart';
import 'package:clone_of_amazon/common/widgets/custom_textformfield.dart';
import 'package:clone_of_amazon/constant/global_variables.dart';
import 'package:clone_of_amazon/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        password: _passCtrl.text);
  }

  void signinUser() {
    authService.signInUser(
      context: context,
      email: _emailCtrl.text,
      password: _passCtrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: Text(
                  "Create account.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextformfield(
                          controller: _nameCtrl,
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextformfield(
                          controller: _emailCtrl,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextformfield(
                          controller: _passCtrl,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Sign up",
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: Text(
                  "Sign in.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextformfield(
                          controller: _emailCtrl,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextformfield(
                          controller: _passCtrl,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Sign in",
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signinUser();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
