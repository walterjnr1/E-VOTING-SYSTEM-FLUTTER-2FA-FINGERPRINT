import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login_otp.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController txtvoterid_F = TextEditingController();

class loginclass {
  static Future<void> login(BuildContext context) async {
    var url = "${URL_PREFIX}/login";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'voterID': txtvoterid_F.text,
      }),
    );
    var data = jsonDecode(response.body);
    var message = data["message"];
print(message);
    if (response.statusCode == 201) {
  
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('voterid_session', txtvoterid_F.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login_otp()));
      } else {
           showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'Invalid Voter ID',
          ),
        );

      }
    }
  }

