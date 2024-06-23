import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controllerLogin.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class voterlogin extends StatefulWidget {
  @override
  _voterloginState createState() => new _voterloginState();
}

class _voterloginState extends State<voterlogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
  final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

   if (!internetConnectionProvider.hasInternet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorcolour, // Add red background
            content: Text(
              'No Internet Connection Available.....',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        );
      });
    }
        
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header_text(context),
            SizedBox(height: 11.0),
            header_img(context),
            voterid_textfield(context, txtvoterid_F),
            SizedBox(height: 20.0),
            voterloginWidget(),
            SizedBox(height: 2.0),
            RegisterLabel(context),
            SizedBox(width: 5.0),
            Row(
              children: <Widget>[
                voter_signup_button(context),
                SizedBox(width: 5.0),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
