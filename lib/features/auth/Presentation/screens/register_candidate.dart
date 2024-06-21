import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_candidate_Register.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/register_candidate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class candidateregister extends StatefulWidget {
  @override
  _candidateregisterState createState() => new _candidateregisterState();
}

class _candidateregisterState extends State<candidateregister> {
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    //checkConnectivity(context);
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
          'Candiate Registration',
          style: TextStyle(
            fontSize: 21,
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
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          children: <Widget>[
            SizedBox(height: 3.0),
            header_img(context, postUserModel),
            img_path(context, postUserModel),
            SizedBox(height: 12.0),
            fullname(context, postUserModel),
            SizedBox(height: 12.0),
            voterID(context, postUserModel),
            SizedBox(height: 12.0),
            phone(context, postUserModel),
            SizedBox(height: 12.0),
            email(context, postUserModel),
            SizedBox(height: 12.0),
            state(context, postUserModel),
            SizedBox(height: 12.0),
            occupation(context, postUserModel),
            SizedBox(height: 12.0),
            partydropdownwidget(),
            SizedBox(height: 12.0),
            officedropdownwidget(),
            SizedBox(height: 12.0),
            registerbutton(context),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> officedropdownwidget() {
  return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fontcolour2, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fontcolour2, width: 2.0),
        ),
      ),
      dropdownColor: primaryColor,
      value: cmdoffice,
      isExpanded: true, // Add this line
      onChanged: (String? newValue) {
        setState(() {
          cmdoffice = newValue!;
        });
      },
      items: dropdownItems_office);
}

DropdownButtonFormField<String> partydropdownwidget() {
  return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fontcolour2, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fontcolour2, width: 2.0),
        ),
      ),
      dropdownColor: primaryColor,
      value: cmdparty,
      isExpanded: true, // Add this line
      onChanged: (String? newValue) {
        setState(() {
          cmdparty = newValue!;
        });
      },
      items: dropdownItems_party);
}

  Widget registerbutton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor, shape: const StadiumBorder()),
          onPressed: () {
            setState(() {
              isLoading = true;
            });

            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                isLoading = true;

                registerclass.register(context);
                isLoading = true;
              });
            });
          },
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Loading...',
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: primaryColor, letterSpacing: .5),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 3.0
                          //fontStyle: FontStyle.italic,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ],
                )
              : Text('Register',
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: primaryColor, letterSpacing: .5),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      height: 3.0
                      //fontStyle: FontStyle.italic,
                      )),
        ));
  }
}
