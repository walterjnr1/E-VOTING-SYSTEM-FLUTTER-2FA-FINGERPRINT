import 'package:e_voting_2fa_biometric/features/settings/Domain/logoutController.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/screens/changepassword.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/screens/voter_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/settings/Domain/controllerDeleteAccount.dart';

class settingswidget extends StatefulWidget {
  const settingswidget({super.key});

  @override
  State<settingswidget> createState() => _settingswidgetState();
}

class _settingswidgetState extends State<settingswidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Widget logout_btn(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
                alignment: Alignment.center,
                child: Text("Logout",
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: fontcolour2, letterSpacing: .5),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ))),
            content: const Text('Are you sure you want to Logout ?'),
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
                  backgroundColor: buttoncolour,
                ),
                onPressed: () {
                  logout(context);
                },
              ),
            ],
          );
        },
      );
    },
    icon: Icon(
      Icons.logout,
      color: primaryColor,
    ),
    label: Text("Logout",
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        )),
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: AppColor,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.4, vertical: 7),
        textStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
  );
}

Widget profile_card(BuildContext context) {
  return Container(
      height: 58,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(Icons.account_box_outlined),
          title: Text("Profile"),
          subtitle: Text("Manage Your Profile details",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                fontSize: 13,
              )),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => voterProfile()));
          },
        ),
      ));
}

Widget logout_card(BuildContext context) {
  return Container(
      height: 58,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Align(
                      alignment: Alignment.center,
                      child: Text("Logout",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: fontcolour2, letterSpacing: .5),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle.italic,
                          ))),
                  content: const Text('Are you sure you want to Logout ?'),
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
                        logout(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ));
}

Widget deleteAccount_card(BuildContext context) {
  return Container(
    height: 58,
    child: Card(
      margin: const EdgeInsets.all(0),
      child: ListTile(
        leading: Icon(Icons.delete),
        title: Text('Delete Account',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: errorcolour,
                  letterSpacing: .5,
                  fontWeight: FontWeight.bold),
              fontSize: 13,
            )),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Align(
                    alignment: Alignment.center,
                    child: Text("Delete Account",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: fontcolour2, letterSpacing: .5),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ))),
                content: const Text(
                    'Are you sure you want to Delete This Account ?'),
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
                      backgroundColor: buttoncolour,
                    ),
                    onPressed: () {
                      DeleteAccountClass.DeleteAccount(context);
                    },
                  ),
                ],
              );
            },
          );
        }, // Add an onTap event here
      ),
    ),
  );
}

Widget changePassword_card(BuildContext context) {
  return Container(
      height: 58,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: ListTile(
          leading: Icon(Icons.password),
          title: Text("Change Password"),
          // subtitle: Text("Talk to our Agent"),
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => changepassword()));
          },
        ),
      ));
}

Widget app_trademark_img(BuildContext context) {
  return Container(
    height: 66,
    width: 100,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/logo.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}

//get current year
getCurrentDate() {
  return DateFormat('yyyy').format(DateTime.now());
}

Widget app_trademark_text(BuildContext context) {
  return Center(
      child: Text(
          '${getCurrentDate()} \u00a9 DEPLOYING A SECURED MOBILE-BASED VOTING SYSTEM USING 2FA SECURITY. By: NGOMESIEGH BORIS MBIZIWUEH.',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
            fontSize: 9,
            fontWeight: FontWeight.w700,
          )));
}
