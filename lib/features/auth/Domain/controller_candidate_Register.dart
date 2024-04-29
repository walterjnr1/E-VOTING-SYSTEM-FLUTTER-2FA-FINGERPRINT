import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController txtfullname_F = TextEditingController();
TextEditingController txtvoterID_F = TextEditingController();
TextEditingController txtphone_F = TextEditingController();
TextEditingController txtemail_F = TextEditingController();
TextEditingController txtstate_F = TextEditingController();
TextEditingController txtoccupation_F = TextEditingController();
TextEditingController txtimg_F = TextEditingController();


//Select office dropdownlist
String cmdoffice = "Select Position";
List<DropdownMenuItem<String>> get dropdownItems_office {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        child: Text("Select Position"), value: "Select Position"),
    const DropdownMenuItem(child: Text("President"), value: "President"),
    const DropdownMenuItem(child: Text("Governor"), value: "Governor"),
  ];
  return menuItems;
}


//Select party dropdownlist
String cmdparty = "Select Party";

List<DropdownMenuItem<String>> get dropdownItems_party {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Select Party"), value: "Select Party"),
    const DropdownMenuItem(child: Text("Alliance Democratic Party (ADC)"), value: "Alliance Democratic Party (ADC)"),
    const DropdownMenuItem(child: Text("Labour Party (LP)"), value: "Labour Party (LP)"),
    const DropdownMenuItem(child: Text("Accord Party (A)"), value: "Accord Party (A)"),

  ];
  return menuItems;
}

class registerclass {
  
  static Future<void> register(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/registerCandidate";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "fullname": txtfullname_F.text,
      "phone": txtphone_F.text,
      "email": txtemail_F.text,
      "occupation": txtoccupation_F.text,
      "voterID": voterid_session,
      "office": cmdoffice,
      "party": cmdparty,
      "image": txtimg_F.text,

    });

    var data = jsonDecode(response.body);
    var message = data["message"];

    if (response.statusCode == 201) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => success()));
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
