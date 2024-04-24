import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';

class voterRegistrationsuccesswidget extends StatefulWidget {
  const voterRegistrationsuccesswidget({super.key});

  @override
  State<voterRegistrationsuccesswidget> createState() =>
      _voterRegistrationsuccesswidgetState();
}

class _voterRegistrationsuccesswidgetState
    extends State<voterRegistrationsuccesswidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget successimage_Section =
    Icon(Icons.check_circle, size: 150, color: successcolour);

PreferredSizeWidget AppbarSection(BuildContext context) {
  return AppBar(
    elevation: 0,

    title: Text(''),
    actions: <Widget>[
      TextButton(
        child: Text('Done',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: successcolour,
            )),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BottomMenu()));
        },
      )
    ],
    backgroundColor: primaryColor,
    //actions: widgets,
  );
}

Widget Addedtext(BuildContext context) {
  return Center(
    child: Text("Success",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: successcolour, letterSpacing: .5),
          fontSize: 21,
          fontWeight: FontWeight.w700,
          //fontStyle: FontStyle.italic,
        )),
  );
}
