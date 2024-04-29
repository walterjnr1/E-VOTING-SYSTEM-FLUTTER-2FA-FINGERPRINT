import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/statisticGovernor.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/statisticPresident.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectResultWidget extends StatefulWidget {
  @override
  _selectResultWidgetState createState() => new _selectResultWidgetState();
}

class _selectResultWidgetState extends State<selectResultWidget> {
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
          subtitle: Text("President",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => statisticPresident()));
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
          subtitle: Text("Governor",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => statisticGovernor()));
          },
        ),
      ));
}
