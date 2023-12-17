import 'package:firebase_auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabbedAuthScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sign Up'),
              Tab(text: 'Sign In'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildSignUpScreen(authProvider),
            buildSignInScreen(authProvider),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpScreen(AuthProvider authProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            height: 10,
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

  Widget buildSignInScreen(AuthProvider authProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              authProvider.signIn(
                _emailController.text,
                _passwordController.text,
              );
            },
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
