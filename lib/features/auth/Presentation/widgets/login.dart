import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_voter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controllerLogin.dart';

class voterloginWidget extends StatefulWidget {
  @override
  _voterloginWidgetState createState() => new _voterloginWidgetState();
}

class _voterloginWidgetState extends State<voterloginWidget> {
  bool isLoading = false;
  @override
  void dispose() {
    txtvoterid_F.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor, shape: const StadiumBorder()),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          try {
            await loginclass.login(context);
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading...',
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ],
              )
            : Text('Login',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                )),
      ),
    );
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
    BuildContext context, TextEditingController txtvoterid_F) {
  return TextFormField(
    controller: txtvoterid_F,
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

Widget voter_signup_button(BuildContext context) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => voterregister()));
      },
      child: Container(
        color: successcolour,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: const Text(
          'Signup as Voter',
          style: TextStyle(color: fontcolour, fontSize: 14.0),
        ),
      ),
    ),
  );
}
