import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/widgets/profile.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => new _profileState();
}

class _profileState extends State<profile> {
  bool isLoading = false;
  TextEditingController txtvoterid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController cmdmaritalstatus = TextEditingController();
  TextEditingController cmdsex = TextEditingController();
  TextEditingController txtdob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Profile',
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
            SizedBox(height: 10.0),
            fullname_textfield(context, txtvoterid),
            SizedBox(height: 5.0),
           maritalstatus_textfield(context, cmdmaritalstatus),
            SizedBox(height: 5.0),
            sex_textfield(context, cmdsex),
            SizedBox(height: 5.0),
            Dateofbirth_textfield(context, txtdob),
            SizedBox(height: 5.0),
            phone_textfield(context, txtvoterid),
            SizedBox(height: 5.0),
            email_textfield(context, txtvoterid),
             SizedBox(height: 5.0),
            address_textfield(context, txtvoterid),
            SizedBox(height: 10.0),
            button(context),
            SizedBox(height: 5.0),

          ],
        ),
      ),
    );
  }

  String selectedStatus = "Select Marital Status";
 Widget maritalstatus_textfield(
    BuildContext context, TextEditingController cmdmaritalstatus) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color:fontcolour2, width: 2.0),
      //borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10.0), // Add padding here
      child: DropdownButton<String>(
        value: selectedStatus,
        onChanged: (String? newValue) {
          setState(() {
            selectedStatus = newValue!;
          });
        },
        items: <DropdownMenuItem<String>>[
          const DropdownMenuItem(
              child: Text("Select Marital Status"),
              value: "Select Marital Status"),
          const DropdownMenuItem(child: Text("Married"), value: "Married"),
          const DropdownMenuItem(child: Text("Single"), value: "Single"),
          const DropdownMenuItem(child: Text("Divorce"), value: "Divorce"),
        ],
      ),
    ),
  );
}

  String selectedSex = "Select Gender";
  Widget sex_textfield(
      BuildContext context, TextEditingController cmdsex) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:fontcolour2, width: 2.0),
      ),
    child: Padding(
      padding: EdgeInsets.only(left: 10.0), // Add padding here
      child: DropdownButton<String>(
        value: selectedSex,
        onChanged: (String? newValue) {
          setState(() {
            selectedSex = newValue!;
          });
        },
        items: <DropdownMenuItem<String>>[
          const DropdownMenuItem(
              child: Text("Select Gender"),
              value: "Select Gender"),
          const DropdownMenuItem(child: Text("Female"), value: "Female"),
          const DropdownMenuItem(child: Text("Male"), value: "Male"),
        ],
      ),
    ));
  }
}
