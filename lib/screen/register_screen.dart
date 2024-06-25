import 'package:flutter/material.dart';
import 'package:my_marketplace/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_marketplace/screens/login_screen.dart'; // Add this import
import 'package:my_marketplace/widgets/custom_text_field.dart';
import 'package:my_marketplace/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_password == _confirmPassword) {
        User? user =
            await _authService.registerWithEmailPassword(_email, _password);
        if (user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Passwords do not match')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                hintText: 'Email',
                onChanged: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                hintText: 'Password',
                onChanged: (value) => _password = value,
                obscureText: true,
              ),
              CustomTextField(
                hintText: 'Confirm Password',
                onChanged: (value) => _confirmPassword = value,
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                onPressed: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
