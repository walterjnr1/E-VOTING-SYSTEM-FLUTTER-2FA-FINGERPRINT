import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultClass {

 static Future<List<CandidateModel>> fetchPresidentResult() async {
    // geting response from API.
    var response =await http.get(Uri.parse("${URL_PREFIX}/getPresidentResult"));
    // checking if Get request is successful by 200 status.
    if (response.statusCode == 201) {
      // decoding recieved string data into JSON data.
      var result = jsonDecode(response.body);
      // getting only candidates data from whole covid data which we convert into json.
      List jsonResponse = result["candidates"] as List;

      // return list by maping it with Country class.
      return jsonResponse.map((e) => CandidateModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
