import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/login_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_login_OTP.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class login_otp extends StatefulWidget {
  @override
  _login_otpState createState() => new _login_otpState();
}

class _login_otpState extends State<login_otp> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

    if (!internetConnectionProvider.hasInternet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorcolour, // Add red background
            content: Text(
              'No Internet Connection Available.....',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        );
      });
    }
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header_text(context),
            SizedBox(height: 11.0),
            msg_text(context),
            SizedBox(height: 20.0),
            SizedBox(height: 15.0),
            pincode(context, txtotp_F),
            SizedBox(height: 15.0),
            footer_text(context),
            SizedBox(height: 10.0),
            resend(context),
            SizedBox(height: 5.0),
            continuebtn(context),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  Widget continuebtn(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor, shape: const StadiumBorder()),
          onPressed: () {
            setState(() {
              isLoading = true;
            });

            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                isLoading = true;
                validateLoginOTPclass.login_otp(context);
                isLoading = true;
              });
            });
          },
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Loading...',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: primaryColor, letterSpacing: .5),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 3.0
                          //fontStyle: FontStyle.italic,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ],
                )
              : Text('Continue',
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: primaryColor, letterSpacing: .5),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      height: 3.0
                      //fontStyle: FontStyle.italic,
                      )),
        ));
  }

  Widget pincode(BuildContext context, txtotp_F) {
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
      controller: txtotp_F,
      keyboardType: TextInputType.text,
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
