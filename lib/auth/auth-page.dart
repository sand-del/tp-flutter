import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tp_twitter/auth/app-validator.dart';

import 'app-theme.dart';

class AuthPage extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //la clef du formulaire
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSubmit(BuildContext context) {

    String email = emailController.text!;

    //tester si formulaire valide
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushNamed(context, "/messages");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "background.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "sign_in_icon.png",
                    width: 126,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color(0xDDFFFFFF), fontSize: 38),
                    ),
                  ),
                  AppTheme.wrapFormPadding(
                      TextFormField(
                        controller: emailController,
                    validator: AppValidator.emailValidator,
                    style: TextStyle(color: Colors.white),
                    decoration: AppTheme.fieldDecoration(
                        "Email", "Veuillez saisir un email"),
                  )),
                  AppTheme.wrapFormPadding(TextFormField(
                    controller: passwordController,
                    validator: AppValidator.passwordValidator,
                    style: TextStyle(color: Colors.white),
                    decoration: AppTheme.fieldDecoration(
                        "Password", "Veuillez saisir un mot de passe"),
                  )),
                  AppTheme.wrapFormPadding(Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      Text(
                        "Mémoriser mes informations",
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      )
                    ],
                  )),
                  AppTheme.wrapFormPadding(SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Submit'),
                          )))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
