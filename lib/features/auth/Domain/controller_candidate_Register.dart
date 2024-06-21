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
const DropdownMenuItem(
  child: Text("Cameroon People's Democratic Movement(CPDM)",overflow: TextOverflow.ellipsis
  ), value: "Cameroon People's Democratic Movement(CPDM)"),
    const DropdownMenuItem(child: Text("Social Democratic Front(SDF)"), value: "Social Democratic Front(SDF)"),
    const DropdownMenuItem(child: Text("Cameroon Renaissance Movement(MRC)"), value: "Cameroon Renaissance Movement(MRC)"),
    const DropdownMenuItem(child: Text("Cameroon people's party"), value: "Cameroon people's party"),
    const DropdownMenuItem(child: Text("Cameroonian Party for National Reconciliation(PCRN)"), value: "Cameroonian Party for National Reconciliation(PCRN)"),
    const DropdownMenuItem(child: Text("Cameroon Democratic Union (CDU)"), value: "Cameroon Democratic Union (CDU)"),
    const DropdownMenuItem(child: Text("Cameroon National Salvation Front (CNSF)"), value: "Cameroon National Salvation Front (CNSF)"),
    const DropdownMenuItem(child: Text("National Union for Democracy and Progress(UNDP)"), value: "National Union for Democracy and Progress(UNDP)"),
    const DropdownMenuItem(child: Text("Movement for the Defence of the Republic (MDR)"), value: "Movement for the Defence of the Republic (MDR)"),
      const DropdownMenuItem(child: Text("Union of Socialist Movements (USM)"), value: "Union of Socialist Movements (USM)"),

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
      "voterID": voterid_session,
      "office": cmdoffice,
      "party": cmdparty,
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
