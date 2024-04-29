import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_Model.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/votePresident.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PresidentCandidates extends StatefulWidget {
  @override
  _PresidentCandidatesState createState() => _PresidentCandidatesState();
}

class _PresidentCandidatesState extends State<PresidentCandidates> {
  Future<List<CandidateModel>> getPresidentList() async {
    final response =
        await http.get(Uri.parse(("${URL_PREFIX}/selectPresident")));

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<CandidateModel> candidate = items.map<CandidateModel>((json) {
      return CandidateModel.fromJson(json);
    }).toList();
    setState(() {
      candidates = candidate;
    });

    return candidate;
  }

  bool isLoading = false;
  // String query = '';
  List<CandidateModel> candidates = [];
  late Future<List<CandidateModel>> candidate;
  @override
  void initState() {
    super.initState();
    candidate = getPresidentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Presidential Election',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            candidate = getPresidentList();
          });
        },
        child: Center(
          child: FutureBuilder<List<CandidateModel>>(
            future: candidate,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data?[index];

                    return GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('NewCandidateid_session',
                            data!.candidateID.toString());
                        prefs.setString(
                            'NewImage_session', data.image.toString());
                        prefs.setString(
                            'NewFullname_session', data.fullname.toString());
                        prefs.setString(
                            'NewParty_session', data.party.toString());

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VotePresident()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 4,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${img_url}/${data?.image??"https://images.unsplash.com/photo-1528460033278-a6ba57020470?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmxhbmslMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"}',
                                height: 145,
                                width: MediaQuery.of(context).size.width / 0.8,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '${data?.fullname}-${data?.party}-${data?.candidateID}',
                                      style: TextStyle(
                                          color: successcolour,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 2.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                    mainAxisExtent: 220,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
  color: AppColor, // Change the color here
  strokeWidth: 2.5,
),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
