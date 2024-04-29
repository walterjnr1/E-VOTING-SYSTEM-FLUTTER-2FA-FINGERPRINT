import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_home.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/dashboard_bottombar.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/screens/settings.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectresult.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;
  List screens = [
    dashboardScreen(),
    selectElection(),
    selectResult(),
    settings(),
    ()
  ];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: screens.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomMenuWidget(
          selectedIndex: selectedIndex,
          onClicked: onClicked,
        ));
  }
}
