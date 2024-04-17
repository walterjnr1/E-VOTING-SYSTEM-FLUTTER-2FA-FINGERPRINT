import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/dashboard_home.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/widgets/slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  bool visible = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              'Hi, Ndueso Walter',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: AppColor,
                  letterSpacing: .5,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: CachedNetworkImageProvider(
                'https://media.istockphoto.com/id/1406307321/photo/portrait-of-successful-mature-businessman-standing-in-office.jpg?s=612x612&w=0&k=20&c=APB5rnVGubmhg4LmFyZJBBUU_duWEgbJ1m3AcygIeXw='),
            backgroundColor: Colors.transparent,
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
                  //AddRequest(context)
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
      height: 250,
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
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  height: 1.5, // Add this line to set the line height
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
