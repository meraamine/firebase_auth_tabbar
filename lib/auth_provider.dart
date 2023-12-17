import 'package:firebase_auth_provider/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  // Sign up with email and password
  Future<void> signUp(String email, String password) async {
    final UserCredential? userCredential =
        await _authService.signUpWithEmailAndPassword(email, password);
    _user = userCredential!.user;
    notifyListeners();
  }

  // Sign in with email and password
  Future<void> signIn(String email, String password) async {
    final UserCredential? userCredential =
        await _authService.signInWithEmailAndPassword(email, password);
    _user = userCredential?.user;
    notifyListeners();
  }

  // Sign out
  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
