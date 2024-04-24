import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:flutter/material.dart';

class candidateregisterWidget extends StatefulWidget {
  @override
  _candidateregisterWidgetState createState() =>
      new _candidateregisterWidgetState();
}

class _candidateregisterWidgetState extends State<candidateregisterWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add your refresh logic here
      },
      child: Scaffold(
          // Add your other widgets here
          ),
    );
  }
}

Widget header_img(BuildContext context, DataClassVoter postUserModel) {
  return Center(
    child: CircleAvatar(
      backgroundImage:
          NetworkImage('${img_url}/${postUserModel.post?.image ?? ""}'),
      //NetworkImage(
      //'https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.webp?b=1&s=170667a&w=0&k=20&c=2jxUr_WTdJyMUD0OcnXD1Fdbb63f8TDkTvpcPsA7aHI='),
      minRadius: 66,
      maxRadius: 66,
    ),
  );
}

Widget fullname_textfield(BuildContext context, DataClassVoter postUserModel) {
  return Text('Fullname: ${postUserModel.post?.fullname ?? ""}',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: fontcolour2,
          fontSize: 19,
          fontWeight: FontWeight.w600));
}

Widget state_textfield(BuildContext context, DataClassVoter postUserModel) {
  return Text('State: ${postUserModel.post?.state ?? ""}',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: fontcolour2,
          fontSize: 19,
          fontWeight: FontWeight.w600));
}

Widget email_textfield(BuildContext context, DataClassVoter postUserModel) {
  return Text('Email: ${postUserModel.post?.email ?? ""}',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: fontcolour2,
          fontSize: 19,
          fontWeight: FontWeight.w600));
}

Widget phone_textfield(BuildContext context, DataClassVoter postUserModel) {
  return Text('Phone: ${postUserModel.post?.phone ?? ""}',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: fontcolour2,
          fontSize: 19,
          fontWeight: FontWeight.w600));
}

Widget voterid_textfield(BuildContext context, DataClassVoter postUserModel) {
  return Text('Voter ID: ${postUserModel.post?.voterID ?? ""}',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: fontcolour2,
          fontSize: 19,
          fontWeight: FontWeight.w600));
}
