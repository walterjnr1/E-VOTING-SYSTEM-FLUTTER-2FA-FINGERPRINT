import 'package:e_voting_2fa_biometric/core/services/error_internet_connection.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/widgets/voteSuccess.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VoteSuccess extends StatefulWidget {
  @override
  _VoteSuccessState createState() => new _VoteSuccessState();
}

class _VoteSuccessState extends State<VoteSuccess> {
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
