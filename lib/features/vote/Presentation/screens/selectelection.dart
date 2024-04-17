import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/widgets/selectelection.dart';
import 'package:flutter/material.dart';

class selectElection extends StatefulWidget {
  @override
  _selectElectionState createState() => new _selectElectionState();
}

class _selectElectionState extends State<selectElection> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 44.0),
            presidentElection(context),
            SizedBox(height: 20.0),
            governorElection(context),
          ],
        ),
      ),
    );
  }
}
