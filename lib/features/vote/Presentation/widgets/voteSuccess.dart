import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';

class VoteSuccessWidget extends StatefulWidget {
  const VoteSuccessWidget({super.key});

  @override
  State<VoteSuccessWidget> createState() => _VoteSuccessWidgetState();
}

class _VoteSuccessWidgetState extends State<VoteSuccessWidget> {
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

Widget Addedtext1(BuildContext context) {
  return Center(
    child: Text("Success",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: successcolour, letterSpacing: .5),
          fontSize: 25,
          fontWeight: FontWeight.w700,
          //fontStyle: FontStyle.italic,
        )),
  );
}

Widget Addedtext2(BuildContext context) {
  return Center(
    child: Text("Congratulations. You Successfully Voted",
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: successcolour, letterSpacing: .5),
          fontSize: 21,
          fontWeight: FontWeight.w700,
          //fontStyle: FontStyle.italic,
        )),
  );
}

Widget continueButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => selectElection()));
    },
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      backgroundColor: AppColor, // Add this line with your desired color
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        'CONTINUE VOTING',
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
          fontSize: 21,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
