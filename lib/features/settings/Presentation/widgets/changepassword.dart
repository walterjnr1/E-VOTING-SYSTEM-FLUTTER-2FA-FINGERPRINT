import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class changepasswordWidget extends StatefulWidget {
  @override
  _changepasswordWidgetState createState() => new _changepasswordWidgetState();
}

class _changepasswordWidgetState extends State<changepasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget oldpassword_textfield(BuildContext context,
    TextEditingController txtpassword, obscureText1, toggle1) {
  return TextFormField(
    controller: txtpassword,
    obscureText: obscureText1,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Old Password',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      suffixIcon: InkWell(
        onTap: toggle1,
        child: Icon(
          obscureText1 ? Icons.visibility : Icons.visibility_off,
          size: 20.0,
          color: fontcolour2,
        ),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Old Password';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}
Widget newpassword_textfield(BuildContext context,
    TextEditingController txtnewpassword, obscureText2, toggle2) {
  return TextFormField(
    controller: txtnewpassword,
    obscureText: obscureText2,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'New Password',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      suffixIcon: InkWell(
        onTap: toggle2,
        child: Icon(
          obscureText2 ? Icons.visibility : Icons.visibility_off,
          size: 20.0,
          color: fontcolour2,
        ),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your New password';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}
Widget confirmpassword_textfield(BuildContext context,
    TextEditingController txtconfirmpassword, obscureText3, toggle3) {
  return TextFormField(
    controller: txtconfirmpassword,
    obscureText: obscureText3,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Confirm Password',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      suffixIcon: InkWell(
        onTap: toggle3,
        child: Icon(
          obscureText3 ? Icons.visibility : Icons.visibility_off,
          size: 20.0,
          color: fontcolour2,
        ),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Confirm password';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}


Widget button(BuildContext context) {
  return Container(
      child: Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          child: Text("Save",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic,
              )),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolour,
          ),
          onPressed: () => null,
        )),
  ));
}

