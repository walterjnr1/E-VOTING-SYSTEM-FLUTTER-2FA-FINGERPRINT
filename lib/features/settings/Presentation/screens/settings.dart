import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/widgets/settings.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text(
            'Settings',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
              fontSize: 21,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          appBar: AppBar(),
          //: <Widget>[],
        ),
        body: Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    child: Column(children: [
                  //logout_btn(context),
                  SizedBox(height: 15),

                  logout_card(context),
                  SizedBox(height: 15),
                  profile_card(context),
                  SizedBox(height: 15),
                  changePassword_card(context),
                  SizedBox(height: 15),
                  deleteAccount_card(context),
                  SizedBox(height: 111),
                  app_trademark_img(context),
                  SizedBox(height: 15),
                  app_trademark_text(context),
                ] //<-----
                        )))));
  }
}
