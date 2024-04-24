import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_register_OTP.dart';

class register_otpWidget extends StatefulWidget {
  @override
  _register_otpWidgetState createState() => new _register_otpWidgetState();
}

class _register_otpWidgetState extends State<register_otpWidget> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 5,
      //obscureText: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: primaryColor,
          inactiveColor: AppColor,
          inactiveFillColor: primaryColor,
          selectedFillColor: Light_bgColor,
          selectedColor: successcolour,
          activeColor: AppColor),
      cursorColor: fontcolour2,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: txtcode_F,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: fontcolour2,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
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
            text: 'Enter the OTP sent to your Phone and Email. OTP expires after 15 minutes',
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

Widget otp_textfield(
    BuildContext context, TextEditingController txtcode_F) {
  return TextFormField(
    controller: txtcode_F,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'otp',
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



Widget resend(BuildContext context) {
  return TextButton(
    onPressed: () {
      validateRegistrationOTPclass.resendotp(context);
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
