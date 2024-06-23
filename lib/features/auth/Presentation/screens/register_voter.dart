import 'dart:io';
import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Domain/controller_Voter_Register.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/register_voter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class voterregister extends StatefulWidget {
  @override
  _voterregisterState createState() => new _voterregisterState();
}

class _voterregisterState extends State<voterregister> {
  bool isLoading = false;
  File? pickedimage;

  Future pickImage() async {
    try {
      final pickedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedimage == null) return;
      final imageTemp = File(pickedimage.path);

      setState(() => this.pickedimage = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to Pick Image: $e');
    }
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
          'Voter Registration',
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
            SizedBox(height: 15.0),
            uploadimage(context, pickedimage),
            SizedBox(height: 5.0),
            fullname_textfield(context, txtfullname_F),
            SizedBox(height: 5.0),
            maritalstatusdropdownwidget(),
            SizedBox(height: 5.0),
            sexdropdownwidget(),
            SizedBox(height: 5.0),
            Dateofbirth_textfield(context, txtdob_F),
            SizedBox(height: 5.0),
            phone_textfield(context, txtphone_F),
            SizedBox(height: 5.0),
            email_textfield(context, txtemail_F),
            SizedBox(height: 5.0),
            address_textfield(context, txtaddress_F),
            SizedBox(height: 5.0),
            occupation_textfield(context, txtoccupation_F),
            SizedBox(height: 5.0),
            statedropdownwidget(),
            SizedBox(height: 5.0),
            lga_textfield(context, txtlga_F),
            SizedBox(height: 5.0),
            qualificationdropdownwidget(),
            SizedBox(height: 5.0),
            registerbutton(context),
            SizedBox(height: 2.0),
            alreadyvoter(context),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  Widget uploadimage(BuildContext context, File? pickedimage) {
    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () {
            pickImage();
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
            size: 24.0,
          ),
          label: const Text('Upload Voter Image'),
        ),
        Container(
          width: double.infinity,
          height: 100,
          child: pickedimage != null
              ? Image.file(pickedimage)
              : const Text("No image selected"),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> sexdropdownwidget() {
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
        value: cmdsex,
        onChanged: (String? newValue) {
          setState(() {
            cmdsex = newValue!;
          });
        },
        items: dropdownItems_Sex);
  }

  DropdownButtonFormField<String> maritalstatusdropdownwidget() {
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
        value: cmdmaritalstatus,
        onChanged: (String? newValue) {
          setState(() {
            cmdmaritalstatus = newValue!;
          });
        },
        items: dropdownItems_maritalstatus);
  }

  DropdownButtonFormField<String> qualificationdropdownwidget() {
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
        value: cmdqualification,
        onChanged: (String? newValue) {
          setState(() {
            cmdqualification = newValue!;
          });
        },
        items: dropdownItems_qualification);
  }
DropdownButtonFormField<String> statedropdownwidget() {
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
        value: cmdstate,
        onChanged: (String? newValue) {
          setState(() {
            cmdstate = newValue!;
          });
        },
        items: dropdownItems_State);
  }
  Widget registerbutton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor, shape: const StadiumBorder()),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          try {
            await Voter.registerVoter(context, pickedimage!);
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading...',
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ],
              )
            : Text('Save',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                )),
      ));
  }
}
