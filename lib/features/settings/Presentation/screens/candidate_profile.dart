import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/error_internet_connection.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_candidate.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/widgets/candidate_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class candidateProfile extends StatefulWidget {
  @override
  _candidateProfileState createState() => new _candidateProfileState();
}

class _candidateProfileState extends State<candidateProfile> {
  @override
  void initState() {
    super.initState();

    final postCandidateModel = Provider.of<DataClassCandidate>(context, listen: false);
    postCandidateModel.getPostData();


    final postVoterModel = Provider.of<DataClassVoter>(context, listen: false);
    postVoterModel.getPostData();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final postCandidateModel = Provider.of<DataClassCandidate>(context);
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
      appBar: BaseAppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
            fontSize: 21,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          header_Section(context, postCandidateModel ),
          body_section(context, postCandidateModel  ),
        ],
      ),
    );
  }
}
