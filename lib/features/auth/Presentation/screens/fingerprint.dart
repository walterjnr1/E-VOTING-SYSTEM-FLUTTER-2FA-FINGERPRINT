import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/utils/authentication.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class fingerPrint extends StatefulWidget {
  @override
  _fingerPrintState createState() => new _fingerPrintState();
}

class _fingerPrintState extends State<fingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 33.0, right: 33.0),
          children: <Widget>[
            Flexible(
              child: Text(
                'Use your Fingerprint to Login to the voting Platform ',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: AppColor, letterSpacing: .5),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 55),
            Expanded(
              child: Container(
                width: 33,
                child: ElevatedButton(
                  onPressed: () async {
                    bool auth = await Authentication.authentication();
                    print('Can Authenticate: $auth');
                    if (auth) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => selectElection()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    backgroundColor:
                        AppColor, // Add this line with your desired color
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.fingerprint, size: 24.0, color: primaryColor),
                      SizedBox(width: 2.0),
                      Text(
                        'LOGIN WITH FINGERPRINT ',
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: primaryColor, letterSpacing: .5),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
