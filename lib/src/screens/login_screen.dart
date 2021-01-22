import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';
import 'package:login_stateful/src/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailField(),
              buildPasswordField(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              buildSubmitButton(),
            ],
          )),
    );
  }

  RaisedButton buildSubmitButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          _user.save();
        }
      },
      child: const Text('Submit', style: TextStyle(fontSize: 20)),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        obscureText: true,
        validator: validatePassword,
        onSaved: (value) {
          setState(() {
            _user.password = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Enter your password',
        ));
  }

  TextFormField buildEmailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (value) {
          setState(() {
            _user.email = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Enter your email',
        ));
  }
}
