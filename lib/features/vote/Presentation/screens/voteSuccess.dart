import 'package:e_voting_2fa_biometric/features/vote/Presentation/widgets/voteSuccess.dart';
import 'package:flutter/material.dart';

class VoteSuccess extends StatefulWidget {
  @override
  _VoteSuccessState createState() => new _VoteSuccessState();
}

class _VoteSuccessState extends State<VoteSuccess> {
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
            Addedtext2(context),
            SizedBox(height: 66),
            continueButton(context)
          ],
        ),
      ),
    );
  }
}
