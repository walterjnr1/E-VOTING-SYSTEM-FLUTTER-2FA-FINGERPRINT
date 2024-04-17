import 'package:e_voting_2fa_biometric/core/Appbar.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/widgets/register_candidate.dart';
import 'package:flutter/material.dart';

class candidateregister extends StatefulWidget {
  @override
  _candidateregisterState createState() => new _candidateregisterState();
}

class _candidateregisterState extends State<candidateregister> {
  bool isLoading = false;
  TextEditingController txtvoterid = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          '',
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
            header_text(context),
            SizedBox(height: 11.0),
            header_img(context),
            voterid_textfield(context, txtvoterid),
            SizedBox(height: 12.0),
               office_textfield(context, txtvoterid),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }




  String selectedoffice = "Select Office";
 Widget office_textfield(
    BuildContext context, TextEditingController cmdmaritalstatus) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color:fontcolour2, width: 2.0),
      //borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10.0), // Add padding here
      child: DropdownButton<String>(
        value: selectedoffice,
        onChanged: (String? newValue) {
          setState(() {
            selectedoffice = newValue!;
          });
        },
        items: <DropdownMenuItem<String>>[
          const DropdownMenuItem(
              child: Text("Select Office"),
              value: "Select Office"),
          const DropdownMenuItem(child: Text("President"), value: "President"),
          const DropdownMenuItem(child: Text("Governor"), value: "Governor"),
        ],
      ),
    ),
  );
}
}
