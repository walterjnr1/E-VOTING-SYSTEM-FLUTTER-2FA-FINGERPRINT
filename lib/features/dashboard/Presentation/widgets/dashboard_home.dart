import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_candidate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboardScreenWidget extends StatefulWidget {
  @override
  State<dashboardScreenWidget> createState() => _dashboardScreenWidgetState();
}

class _dashboardScreenWidgetState extends State<dashboardScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  bool visible = true;
}

Widget registerCandidate(BuildContext context) {
  return Container(
      height: 90,
      child: Card(
        color: bgColor,
        margin: const EdgeInsets.all(3),
        child: ListTile(
          subtitle: Text("Register As Candidate",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 19,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          trailing: Icon(Icons.arrow_circle_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => candidateregister()));
          },
        ),
      ));
}
