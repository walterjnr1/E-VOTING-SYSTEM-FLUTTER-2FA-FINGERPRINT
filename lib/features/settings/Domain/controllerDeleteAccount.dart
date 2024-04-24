import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DeleteAccountClass {
  static Future<void> DeleteAccount(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/deleteAccount";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "voterID": voterid_session
    });

    var data = jsonDecode(response.body);
    var message = data["message"];

    if (response.statusCode == 200) {
       showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => voterlogin()));
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
