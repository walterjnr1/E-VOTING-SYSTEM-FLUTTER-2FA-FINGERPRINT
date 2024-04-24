import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout(BuildContext context) async {
  // Get a reference to the shared preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Remove the user data from shared preferences
  await prefs.remove('voterid_session');
  await prefs.remove('email_session');
  await prefs.remove('phone_session');


  // Clear the cache to ensure that the user is fully logged out
  await prefs.clear();

  // Optionally, you can also close the shared preferences object
  // await prefs.close();

  // Navigate the user back to the login screen
      Navigator.push(context , MaterialPageRoute(builder: (context) => voterlogin()));
}