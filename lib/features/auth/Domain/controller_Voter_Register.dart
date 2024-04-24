import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController txtemail_F = TextEditingController();
TextEditingController txtdob_F = TextEditingController();
TextEditingController txtphone_F = TextEditingController();
TextEditingController txtaddress_F = TextEditingController();
TextEditingController txtfullname_F = TextEditingController();
TextEditingController txtlga_F = TextEditingController();
TextEditingController txtoccupation_F = TextEditingController();

//Select Marital Statusdropdownlist
String cmdmaritalstatus = "Select Marital Status";

List<DropdownMenuItem<String>> get dropdownItems_maritalstatus {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        child: Text("Select Marital Status"), value: "Select Marital Status"),
    const DropdownMenuItem(child: Text("Married"), value: "Married"),
    const DropdownMenuItem(child: Text("Single"), value: "Single"),
    const DropdownMenuItem(child: Text("Divorce"), value: "Divorce"),
  ];
  return menuItems;
}

//Select sex Statusdropdownlist
String cmdsex = "Select Sex";

List<DropdownMenuItem<String>> get dropdownItems_Sex {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Select Sex"), value: "Select Sex"),
    const DropdownMenuItem(child: Text("Female"), value: "Female"),
    const DropdownMenuItem(child: Text("Male"), value: "Male"),
  ];
  return menuItems;
}

//Select sex Statusdropdownlist
String cmdstate = "Select State";

List<DropdownMenuItem<String>> get dropdownItems_State {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Select State"), value: "Select State"),
    const DropdownMenuItem(child: Text("Adamawa"), value: "Adamawa"),
    const DropdownMenuItem(child: Text("Centre"), value: "Centre"),
    const DropdownMenuItem(child: Text("East"), value: "East"),
    const DropdownMenuItem(
        child: Text("Extreme North"), value: "Extreme North"),
    const DropdownMenuItem(child: Text("Littoral"), value: "Littoral"),
    const DropdownMenuItem(child: Text("North"), value: "North"),
    const DropdownMenuItem(child: Text("Northwest"), value: "Northwest"),
    const DropdownMenuItem(child: Text("South"), value: "South"),
    const DropdownMenuItem(child: Text("Southwest"), value: "Southwest"),
    const DropdownMenuItem(child: Text("West"), value: "West"),
  ];
  return menuItems;
}

//Select sex Statusdropdownlist
String cmdqualification = "Select Qualification";

List<DropdownMenuItem<String>> get dropdownItems_Qualification {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        child: Text("Select Qualification"), value: "Select Qualification"),
    const DropdownMenuItem(child: Text("Phd"), value: "Phd"),
    const DropdownMenuItem(child: Text("Msc"), value: "Msc"),
    const DropdownMenuItem(child: Text("Bsc"), value: "Bsc"),
    const DropdownMenuItem(child: Text("HND"), value: "HND"),
    const DropdownMenuItem(child: Text("ND"), value: "ND"),
    const DropdownMenuItem(child: Text("SSCE"), value: "SSCE"),
    const DropdownMenuItem(child: Text("FSLC"), value: "FSLC"),
    const DropdownMenuItem(child: Text("others"), value: "others"),
  ];
  return menuItems;
}

class registerVoter1 {
  static Future<void> registerVoter(
      BuildContext context, File pickedimage) async {
    //store details
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email_session', txtemail_F.text);
    prefs.setString('phone_session', txtphone_F.text);

    var headers = {'Accept': 'application/json'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${URL_PREFIX}/registerVoter'));

    request.fields.addAll({
      'fullname': txtfullname_F.text,
      'maritalstatus': cmdmaritalstatus,
      'sex': cmdsex,
      'DOB': txtdob_F.text,
      'phone': txtphone_F.text,
      'email': txtemail_F.text,
      'address': txtaddress_F.text,
      'lga': txtlga_F.text,
      'state': cmdstate,
      'occupation': txtoccupation_F.text,
      'status': '1',
      'educational_qualification': cmdqualification
    });

    request.files
        .add(await http.MultipartFile.fromPath('image', pickedimage.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    String message = await response.stream.transform(utf8.decoder).join();
    print(message);

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => register_otp()));
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
  }
}
