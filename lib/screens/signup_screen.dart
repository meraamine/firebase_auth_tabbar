import 'package:firebase_auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      // Your signup screen UI
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () {
              authProvider.signUp(
                _emailController.text,
                _passwordController.text,
              );
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
