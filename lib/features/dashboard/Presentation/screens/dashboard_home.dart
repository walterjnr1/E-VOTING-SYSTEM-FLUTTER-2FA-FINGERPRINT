import 'package:e_voting_2fa_biometric/core/App_constant/constant.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/dashboard_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/slider.dart';
import 'package:provider/provider.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  bool visible = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final postUserModel = Provider.of<DataClassVoter>(context, listen: false);
    postUserModel.getPostData();

    Future.delayed(Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {
          isLoading = false;
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postUserModel = Provider.of<DataClassVoter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              'Hi, ${postUserModel.post?.fullname ?? ""}',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: AppColor,
                  letterSpacing: .5,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 35),
            Positioned(
              bottom: 0,
              left: 0,
              child: Text(
                'ID: ${postUserModel.post?.voterID ?? ""}',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: AppColor,
                    letterSpacing: .5,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('${img_url}/${postUserModel.post?.image ?? ""}'),
            // NetworkImage(
            // 'https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.webp?b=1&s=170667a&w=0&k=20&c=2jxUr_WTdJyMUD0OcnXD1Fdbb63f8TDkTvpcPsA7aHI='),
            minRadius: 66,
            maxRadius: 66,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_add,
                      size: 30,
                      color: itemcolor,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 6,
                    child: Container(
                      height: 18,
                      width: 18,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: itemcounter,
                      ),
                      child: const Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: primaryColor,
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  SizedBox(height: 11),
                  CarouselSliderSection,
                  SizedBox(height: 11),
                  Visibility(
                    visible: visible,
                    child: how_to_use(context),
                  ),
                  registerCandidate(context)
                ])),
          ],
        ),
      ),
    );
  }

  Widget how_to_use(
    BuildContext context,
  ) {
    return Container(
      height: 270,
      child: Card(
        //color: bgColor2,
        //margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        shadowColor: Light_bgColor,
        child: Container(
          //margin: EdgeInsets.all(15),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text("How to use Our E-voting App",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            subtitle: Text(
                ' 1. Register as a voter\n 2. Register as a candidate if necesssary\n 3. login by providing voter ID and password\n 4. Enter OTP will be sent to your register phone Number or Email\n 5. Scan your fingerprint\n 6. Select type of election\n 7. Vote on your candidate of choice',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                  fontSize: 12.5,
                  fontWeight: FontWeight.normal,
                  //height: 1.5, // Add this line to set the line height
                )),
            trailing: Icon(Icons.cancel),
            onTap: () {
              if (mounted) {
                setState(() {
                  visible = !visible;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
