import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/widgets/candidates.dart';
import 'package:flutter/material.dart';

class candidates extends StatefulWidget {
  @override
  _candidatesState createState() => _candidatesState();
}

class _candidatesState extends State<candidates> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Presidential Election',
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
        child: GridView.count(
          crossAxisCount: 2, // Set the number of columns here
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 2.0, right: 2.0, top: 20.0),
          children: List.generate(
            8,
            (index) {
              return Container(
                padding: EdgeInsets.all(2.0),
                child: candidate1(context),
              );
            },
          ),
        ),
      ),
    );
  }
}
