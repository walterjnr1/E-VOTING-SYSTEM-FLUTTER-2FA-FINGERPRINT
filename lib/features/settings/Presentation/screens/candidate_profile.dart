import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_candidate.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/widgets/candidate_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final postVoterModel = Provider.of<DataClassVoter>(context);

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
