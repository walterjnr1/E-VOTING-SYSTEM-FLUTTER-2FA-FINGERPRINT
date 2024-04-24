import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

  Future<CandidateModel?> getSinglePostData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');
   
  CandidateModel? result;
  try {
        var url = "${URL_PREFIX}/getCandidateDetails?voterID=$voterid_session";
      final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },);
    if (response.statusCode == 201) {
      final item = json.decode(response.body);
      result = CandidateModel.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}