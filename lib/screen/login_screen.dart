import 'package:flutter/material.dart';
import 'package:my_marketplace/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_marketplace/screens/home_screen.dart'; // Add this import
import 'package:my_marketplace/widgets/custom_text_field.dart';
import 'package:my_marketplace/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      User? user = await _authService.loginWithEmailPassword(_email, _password);
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
