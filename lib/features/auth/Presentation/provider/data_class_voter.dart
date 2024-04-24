import 'package:e_voting_2fa_biometric/features/auth/Data/model/voter_Model.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_data_service_voter.dart';
import 'package:flutter/material.dart';

class DataClassVoter extends ChangeNotifier {
  VoterModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    VoterModel? fetchedPost = await getSinglePostData();
    if (fetchedPost != null) {
      post = fetchedPost;
    }
    loading = false;

    notifyListeners();
  }
}