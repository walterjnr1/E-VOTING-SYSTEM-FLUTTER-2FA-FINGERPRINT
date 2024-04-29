import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';



class fetchPresidentCandidateClass {
  // variable to call and store future list of candidates
  Future<List<CandidateModel>> postsFuture = getPresidentCandidate();

  // function to fetch data from api and return future list of candidates
  static Future<List<CandidateModel>> getPresidentCandidate() async {
    
    var url = "${URL_PREFIX}/selectPresident";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    final List body = json.decode(response.body);
    return body.map((e) => CandidateModel.fromJson(e)).toList();
  }
}
class fetchGovernorCandidateClass {
  // variable to call and store future list of candidates
  Future<List<CandidateModel>> postsFuture = getGovernorCandidate();

  // function to fetch data from api and return future list of candidates
  static Future<List<CandidateModel>> getGovernorCandidate() async {
    
    var url = "${URL_PREFIX}/selectGovernor";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    final List body = json.decode(response.body);
    return body.map((e) => CandidateModel.fromJson(e)).toList();
  }

  
}



