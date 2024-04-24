import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_candidate.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class candidateProfileWidget extends StatefulWidget {
  const candidateProfileWidget({super.key});

  @override
  State<candidateProfileWidget> createState() => _candidateProfileWidgetState();
}

class _candidateProfileWidgetState extends State<candidateProfileWidget> {
  @override
  void initState() {
    super.initState();

    final postCandidateModel =
        Provider.of<DataClassCandidate>(context, listen: false);
    postCandidateModel.getPostData();

    final postVoterModel = Provider.of<DataClassVoter>(context, listen: false);
    postVoterModel.getPostData();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget header_Section(BuildContext context,
    DataClassCandidate postCandidateModel, DataClassVoter postVoterModel) {
  return Container(
    height: 160,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [bgColor, Light_bgColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.5, 0.9],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  '${img_url}/${postVoterModel.post?.image ?? ""}'),
              //NetworkImage(
              //'https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.webp?b=1&s=170667a&w=0&k=20&c=2jxUr_WTdJyMUD0OcnXD1Fdbb63f8TDkTvpcPsA7aHI='),
              minRadius: 50,
              maxRadius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '${postCandidateModel.post?.fullname ?? ""}',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Candidate',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget body_section(
    BuildContext context, DataClassCandidate postCandidateModel) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Candidate ID',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.candidateID ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Voter ID',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.voterID ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Position',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.office ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Party',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.party ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Status',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.status == "1" ? "Active" : "Inactive"}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: successcolour, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Occupation',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postCandidateModel.post?.occupation ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
