import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Data/model/candidate_party_model.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/votePresident.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PresidentCandidates extends StatefulWidget {
  @override
  _PresidentCandidatesState createState() => _PresidentCandidatesState();
}

class _PresidentCandidatesState extends State<PresidentCandidates> {
  final TextEditingController txtsearch_F = TextEditingController();

  Future<List<CandidatePartyModel>> getPresidentList_search(
      String query) async {
    final response =
        await http.get(Uri.parse("${URL_PREFIX}/searchPresident?q=$query"));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<CandidatePartyModel> candidate =
        items.map<CandidatePartyModel>((json) {
      return CandidatePartyModel.fromJson(json);
    }).toList();
    return candidate;
  }

  Future<List<CandidatePartyModel>> getPresidentList() async {
    final response = await http
        .get(Uri.parse(("${URL_PREFIX}/getPresidentCandidateDetails")));

    print(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<CandidatePartyModel> candidate =
        items.map<CandidatePartyModel>((json) {
      return CandidatePartyModel.fromJson(json);
    }).toList();

    return candidate;
  }

  bool isLoading = false;
  List<CandidatePartyModel> candidates = [];
  late Future<List<CandidatePartyModel>> candidate;
  @override
  void initState() {
    super.initState();
    candidate = getPresidentList();
  }

  @override
  Widget build(BuildContext context) {
    final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

    if (!internetConnectionProvider.hasInternet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorcolour, // Add red background
            content: Text(
              'No Internet Connection Available.....',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        );
      });
    }
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
        body: Column(children: [
          SizedBox(
            height: 22,
          ),
          //add search bar
       Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextField(
    controller: txtsearch_F,
    decoration: InputDecoration(
      labelText: 'Search',
      hintText: "Voter ID , candidate ID, candidate Name, party Name",
      border: OutlineInputBorder(),
      suffixIcon: Visibility(
        visible: txtsearch_F.text.isNotEmpty,
        child: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            txtsearch_F.clear();
            setState(() {
              candidate = getPresidentList();
            });
          },
        ),
      ),
    ),
    onChanged: (value) async {
      setState(() {
        candidate = getPresidentList_search(value);
      });
    },
  ),
),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  candidate = getPresidentList();
                });
              },
              child: Center(
                child: FutureBuilder<List<CandidatePartyModel>>(
                  future: candidate,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
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
                              prefs.setString('NewFullname_session',
                                  data.fullname.toString());
                              prefs.setString(
                                  'NewPartyname_session', data.name.toString());
                              prefs.setString(
                                  'NewPartylogo_session', data.logo.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VotePresident()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${img_url}/${data?.image.toString() ?? "https://images.unsplash.com/photo-1528460033278-a6ba57020470?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmxhbmslMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"}',
                                          height: 145,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.8,
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
                                                '${data?.name.toString()}-${data?.fullname.toString()}-${data?.candidateID}',
                                                style: TextStyle(
                                                    color: successcolour,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Image.network(
                                      '${img_url}/${data?.logo.toString()}', // replace with your image URL
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
          )
        ]));
  }
}
