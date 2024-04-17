import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class profileWidget extends StatefulWidget {
  @override
  _profileWidgetState createState() => new _profileWidgetState();
}

class _profileWidgetState extends State<profileWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}


Widget fullname_textfield(
    BuildContext context, TextEditingController txtfullname) {
  return TextFormField(
    controller: txtfullname,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Fullname',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Fullname';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

DateTime dateTime = DateTime.now();
Widget Dateofbirth_textfield(BuildContext context, TextEditingController txtdob) {
  return TextFormField(
    readOnly: true,
    controller: txtdob,
    decoration: InputDecoration(
      hintText: ' Date of Birth',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0), // Change border radius to 0
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0), // Change border radius to 0
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0), // Change border radius to 0
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
    ),
    onTap: () async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: dateTime,
          initialDatePickerMode: DatePickerMode.day,
          firstDate: DateTime.now(),
          lastDate: DateTime(2101));
      if (picked!= null) {
        dateTime = picked;
        //assign the chosen date to the controller
        txtdob.text = DateFormat.yMd().format(dateTime);
      }
    },
  );
}


Widget phone_textfield(
    BuildContext context, TextEditingController txtphone) {
  return TextFormField(
    controller: txtphone,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Phone Number',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Phone';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget email_textfield(
    BuildContext context, TextEditingController txtemail) {
  return TextFormField(
    controller: txtemail,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Email',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Email';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}
Widget address_textfield(
    BuildContext context, TextEditingController txtaddress) {
  return TextFormField(
    controller: txtaddress,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Address',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: fontcolour2, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Address';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget button(BuildContext context) {
  return Container(
      child: Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          child: Text("Save Changes",
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: primaryColor, letterSpacing: .5),
                fontSize: 21,
                fontWeight: FontWeight.w700,
                //fontStyle: FontStyle.italic,
              )),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttoncolour,
          ),
          onPressed: () => null,
        )),
  ));
}

