import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_check_if_candidate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class voterProfilewidget extends StatefulWidget {
  const voterProfilewidget({super.key});

  @override
  State<voterProfilewidget> createState() => _voterProfilewidgetState();
}

class _voterProfilewidgetState extends State<voterProfilewidget> {
  @override
  void initState() {
    super.initState();

    final postUserModel = Provider.of<DataClassVoter>(context, listen: false);
    postUserModel.getPostData();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget header_Section(BuildContext context, DataClassVoter postUserModel) {
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
              backgroundImage:
                  NetworkImage('${img_url}/${postUserModel.post?.image ?? ""}'),
              // NetworkImage(
              // 'https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.webp?b=1&s=170667a&w=0&k=20&c=2jxUr_WTdJyMUD0OcnXD1Fdbb63f8TDkTvpcPsA7aHI='),
              minRadius: 50,
              maxRadius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '${postUserModel.post?.fullname ?? ""}',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Voter',
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

Widget body_section(BuildContext context, DataClassVoter postUserModel) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          height: 56,
          child: ListTile(
            title: Text(
              'Sex',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.sex ?? ""}',
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
              'Address',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.address ?? ""}',
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
              'Email',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.email ?? ""}',
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
              'Phone',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.phone ?? ""}',
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
              'LGA',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.lga ?? ""}',
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
              'State',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.state ?? ""}',
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
              'Date of birth',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.DOB ?? ""}',
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
              'Occupation',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.occupation ?? ""}',
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
              'Educational Qualification',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${postUserModel.post?.educational_qualification ?? ""}',
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

Widget continuebutton(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 55,
      margin: const EdgeInsets.all(33),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(" View Candidate Profile",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
              fontSize: 21,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
            )),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor,
        ),
        onPressed: () {
          validateVoterclass.check_if_candidate(context);
        },
      ),
    ),
  );
}
