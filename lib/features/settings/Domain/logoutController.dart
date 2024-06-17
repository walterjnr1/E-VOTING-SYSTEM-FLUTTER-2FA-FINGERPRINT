import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout(BuildContext context) async {
  // Get a reference to the shared preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  await prefs.clear();
  Navigator.push(context , MaterialPageRoute(builder: (context) => voterlogin()));
}