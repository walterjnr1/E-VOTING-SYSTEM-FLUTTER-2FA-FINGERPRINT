import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/voter_register_success.dart';
import 'package:flutter/material.dart';

class voterRegistrationsuccess extends StatefulWidget {
  @override
  _voterRegistrationsuccessState createState() => new _voterRegistrationsuccessState();
}

class _voterRegistrationsuccessState extends State<voterRegistrationsuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSection(context),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            successimage_Section,
            SizedBox(height: 40),
            Addedtext(context)
          ],
        ),
      ),
    );
  }
}
