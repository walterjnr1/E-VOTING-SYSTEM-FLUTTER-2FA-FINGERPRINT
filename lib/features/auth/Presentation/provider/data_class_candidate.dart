import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_data_service_candidate.dart';
import 'package:flutter/material.dart';

class DataClassCandidate extends ChangeNotifier {
  CandidateModel? post;
  bool loading = false;

  getCandidatePostData() async {
    loading = true;
    CandidateModel? fetchedPost = await getSingleCandidatePostData();
    if (fetchedPost != null) {
      post = fetchedPost;
    }
    loading = false;

    notifyListeners();
  }
}