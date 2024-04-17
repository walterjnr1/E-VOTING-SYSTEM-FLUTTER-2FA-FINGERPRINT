import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class voterloginWidget extends StatefulWidget {
  @override
  _voterloginWidgetState createState() => new _voterloginWidgetState();
}

class _voterloginWidgetState extends State<voterloginWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget header_img(BuildContext context) {
  return Center(
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/images/fff.jpg'),
      minRadius: 44,
      maxRadius: 55,
    ),
  );
}

Widget voterid_textfield(
    BuildContext context, TextEditingController txtvoterid) {
  return TextFormField(
    controller: txtvoterid,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Voter ID',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget password_textfield(BuildContext context,
    TextEditingController txtpassword, obscureText, toggle) {
  return TextFormField(
    controller: txtpassword,
    obscureText: obscureText,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Password',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      suffixIcon: InkWell(
        onTap: toggle,
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          size: 20.0,
          color: fontcolour2,
        ),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget header_text(BuildContext context) {
  return Center(
      child: Text('Login Screen',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto',
              color: fontcolour2,
              fontSize: 21,
              fontWeight: FontWeight.w600)));
}

Widget RegisterLabel(BuildContext context) {
  return Center(
    child: TextButton(
      child: Text(
        "Don't have Account ? Sign Up",
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () => null,
    ),
  );
}

Widget forgotLabel(BuildContext context) {
  return Center(
      child: Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      child: Text("Forgot Password ?",
          style: TextStyle(
              color: fontcolour2, fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () => null,
    ),
  ));
}

Widget loginbutton(BuildContext context) {
  return Container(
      child: Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          child: Text("Login",
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

Widget voter_signup_button(BuildContext context) {
  return Expanded(
    child: TextButton(
      onPressed: () => null,
      child: Container(
        color: successcolour,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Text(
          'Signup Voter',
          style: TextStyle(color: fontcolour, fontSize: 13.0),
        ),
      ),
    ),
  );
}

Widget candidate_signup_button(BuildContext context) {
  return Expanded(
    child: TextButton(
      onPressed: () => null,
      child: Container(
        color: warning,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Text(
          'Signup Candidate',
          style: TextStyle(color: fontcolour, fontSize: 13.0),
        ),
      ),
    ),
  );
}
