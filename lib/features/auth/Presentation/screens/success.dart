import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class success extends StatefulWidget {
  @override
  _successState createState() => new _successState();
}

class _successState extends State<success> {
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
