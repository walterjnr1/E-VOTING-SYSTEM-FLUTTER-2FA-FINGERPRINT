import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class candidateregisterWidget extends StatefulWidget {
  @override
  _candidateregisterWidgetState createState() => new _candidateregisterWidgetState();
}

class _candidateregisterWidgetState extends State<candidateregisterWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget header_text(BuildContext context) {
  return Center(
      child: Text('Candiate registration form',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto',
              color: fontcolour2,
              fontSize: 21,
              fontWeight: FontWeight.w600)));
}
Widget header_img(BuildContext context) {
  return Center(
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/images/register.jpg'),
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


Widget registerbutton(BuildContext context) {
  return Container(
      child: Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          child: Text("Save",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                //fontStyle: FontStyle.italic,
              )),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolour,
          ),
          onPressed: () => null,
        )),
  ));
}
