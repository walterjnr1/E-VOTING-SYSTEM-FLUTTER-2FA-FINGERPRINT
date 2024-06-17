import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController txtotp_F = TextEditingController();

class validateLoginOTPclass {
  static Future<void> login_otp(BuildContext context) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/validateLoginOTP";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'otp': txtotp_F.text,
        'voterID': voterid_session
      }),
    );
     
   var data = jsonDecode(response.body);
    var message = data["message"];
    print(message);

    if (response.statusCode == 201) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
        //String? voterid_session = prefs.getString('voterid_session');
    prefs.setString('otp_session', voterid_session!);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomMenu()));
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
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/resendOtp";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'voterID': voterid_session
      }),
    );
    var data = jsonDecode(response.body);
    var message = data["message"];
print(message);
    if (response.statusCode == 201) {
      
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
