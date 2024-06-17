import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/error_internet_connection.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_candidate_Register.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/register_candidate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
      // If there's no internet connection, push to a new route
      WidgetsBinding.instance.addPostFrameCallback((_) {
       showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'No internet Connection. Try Again',
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
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
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
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fontcolour2, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fontcolour2, width: 2.0),
          ),
        ),
        dropdownColor: primaryColor,
        value: cmdparty,
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
