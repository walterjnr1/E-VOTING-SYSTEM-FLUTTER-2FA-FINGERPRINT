import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController txtcode_F = TextEditingController();

class validateRegistrationOTPclass {
  static Future<void> otp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone_session = prefs.getString('phone_session');

    var url = "${URL_PREFIX}/validateVoterOTP";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'otp': txtcode_F.text,
        'phone': phone_session,
      }),
    );
    var data = jsonDecode(response.body);
    var message = data["message"];

    if (response.statusCode == 201) {

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: 'Your Voter registration process is Complete..',
        ),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => success()));
    } else {
      print(response.body);

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
  }

  static Future<void> resendotp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone_session = prefs.getString('phone_session');

    var url = "${URL_PREFIX}/resendOtp";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'txtphone': phone_session}),
    );

    var message = jsonDecode(response.body);
    if (message == "success") {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message:
              'OTP Has been resent to Your registered Email and Phone Number',
        ),
      );
    } else {
      print(response.body);

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
  }
}
