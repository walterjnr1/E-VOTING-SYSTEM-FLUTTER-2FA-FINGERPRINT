import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/success.dart';
import 'package:flutter/material.dart';

class success extends StatefulWidget {
  @override
  _successState createState() => new _successState();
}

class _successState extends State<success> {
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
