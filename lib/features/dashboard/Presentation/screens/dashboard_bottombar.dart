import 'package:e_voting_2fa_biometric/core/services/error_internet_connection.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/fingerprint.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_home.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/dashboard_bottombar.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/screens/settings.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectresult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;
  List screens = [
    dashboardScreen(),
    fingerPrint(),
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
     final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

    if (!internetConnectionProvider.hasInternet) {
      // If there's no internet connection, push to a new route
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'No internet Connection. Try Again',
          ),
        );
      });
    }
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
