import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/candidates.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectElectionWidget extends StatefulWidget {
  @override
  _selectElectionWidgetState createState() => new _selectElectionWidgetState();
}

class _selectElectionWidgetState extends State<selectElectionWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget header_text(BuildContext context) {
  return Center(
      child: Text('Select Type of Election',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto',
              color: fontcolour2,
              fontSize: 25,
              fontWeight: FontWeight.bold)));
}

Widget presidentElection(BuildContext context) {
  return Container(
      height: 90,
      child: Card(
        color: bgColor,
        margin: const EdgeInsets.all(3),
        child: ListTile(
          subtitle: Text("Presidential",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => candidates()));
          },
        ),
      ));
}

Widget governorElection(BuildContext context) {
  return Container(
      height: 90,
      child: Card(
        color: bgColor,
        margin: const EdgeInsets.all(3),
        child: ListTile(
          subtitle: Text("Governorship",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => voterlogin()));
          },
        ),
      ));
}
