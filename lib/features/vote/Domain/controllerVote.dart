import 'dart:async';
import 'dart:convert';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/voteSuccess.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VoteClass {
  
  static Future<void> vote_President(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');
    String? NewCandidateid_session = prefs.getString('NewCandidateid_session');

    var url = "${URL_PREFIX}/vote_President";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "voterID": voterid_session,
      "candidateID": NewCandidateid_session,
       });

    var data = jsonDecode(response.body);
    var message = data["message"];

    if (response.statusCode == 201) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VoteSuccess()));
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => selectElection()));
    }
  }
  static Future<void> vote_Governor(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');
    String? NewCandidateid_session = prefs.getString('NewCandidateid_session');

    var url = "${URL_PREFIX}/vote_Governor";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "voterID": voterid_session,
      "candidateID": NewCandidateid_session,
       });

    var data = jsonDecode(response.body);
    var message = data["message"];

    if (response.statusCode == 201) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VoteSuccess()));
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => selectElection()
          )
          );
    }
  }
}
