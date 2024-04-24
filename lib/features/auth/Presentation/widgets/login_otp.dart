import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_login_OTP.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login_otpWidget extends StatefulWidget {
  @override
  _login_otpWidgetState createState() => new _login_otpWidgetState();
}

class _login_otpWidgetState extends State<login_otpWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

String currentText = "";
Widget header_text(BuildContext context) {
  return Center(
      child: Text('OTP verification',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: AppColor, letterSpacing: .5),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )));
}

Widget msg_text(BuildContext context) {
  return Center(
      child: RichText(
    text: TextSpan(
      style: GoogleFonts.lato(
        textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
        fontSize: 12,
        fontWeight: FontWeight.normal,
        //fontStyle: FontStyle.italic,
      ),
      children: <TextSpan>[
        TextSpan(
            text: 'Enter the OTP sent to your Phone and Email. OTP expires after 15 minutes.',
            style: GoogleFonts.lato(
                textStyle: TextStyle(color: AppColor, letterSpacing: .5),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                height: 3.0)),
      ],
    ),
  ));
}

Widget footer_text(BuildContext context) {
  return Center(
      child: Text('Didn\'t receive OTP ?',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: AppColor, letterSpacing: .5),
            fontSize: 15,
            //fontWeight: FontWeight.bold,
          )));
}

Widget resend(BuildContext context) {
  return TextButton(
    onPressed: () {
      validateLoginOTPclass.resendotp(context);
    },
    child: Text(
      'Resend',
      style: GoogleFonts.lato(
        textStyle: TextStyle(color: AppColor, letterSpacing: .5),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
