import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/vote/Domain/controllerVote.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoteGovernor extends StatefulWidget {
  @override
  _VoteGovernorState createState() => _VoteGovernorState();
}

class _VoteGovernorState extends State<VoteGovernor> {
  bool isLoading = false;
  late String new_candidateID = '';
  late String new_fullname = '';
  late String new_party = '';
  late String new_image =
      'https://images.unsplash.com/photo-1528460033278-a6ba57020470?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmxhbmslMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        new_candidateID = prefs.getString('NewCandidateid_session')!;
        new_image = prefs.getString('NewImage_session')!;
        new_party = prefs.getString('NewParty_session')!;
        new_fullname = prefs.getString('NewFullname_session')!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Governor Election',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 14.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Image.network(
                            '${img_url}/${new_image}',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        '${new_fullname}-- ${new_party}',
                        style: TextStyle(
                            color: fontcolour2,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Align(
                                  alignment: Alignment.center,
                                  child: Text("Vote ",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: fontcolour2,
                                            letterSpacing: .5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ))),
                              content: const Text(
                                  'Are you sure you want to Vote for This Candidate ?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text("No",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: errorcolour,
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                ElevatedButton(
                                  child: Text("Yes",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor,
                                  ),
                                  onPressed: () {
                                    VoteClass.vote_President(context);
                                  
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: AppColor,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 56)),
                      child: Text(
                        'Vote',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
