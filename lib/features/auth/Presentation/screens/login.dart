import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/login.dart';
import 'package:flutter/material.dart';

class voterlogin extends StatefulWidget {
  @override
  _voterloginState createState() => new _voterloginState();
}

class _voterloginState extends State<voterlogin> {
  bool isLoading = false;
  TextEditingController txtvoterid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header_text(context),
            SizedBox(height: 11.0),
            header_img(context),
            voterid_textfield(context, txtvoterid),
            SizedBox(height: 20.0),
            //password_textfield(context, txtpassword, obscureText, toggle),
            loginbutton(context),
            SizedBox(height: 2.0),
            RegisterLabel(context),
            SizedBox(width: 5.0),
            Row(
              children: <Widget>[
                voter_signup_button(context),
                SizedBox(width: 5.0),
                candidate_signup_button(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}