import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class otp extends StatefulWidget {
  @override
  _otpState createState() => new _otpState();
}

class _otpState extends State<otp> {
    bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
            otpWidget(),
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

                //validateOTPclass.otp(context);
                isLoading = false;
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
}
