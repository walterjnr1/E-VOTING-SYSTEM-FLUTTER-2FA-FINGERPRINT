import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class voterregisterWidget extends StatefulWidget {
  @override
  _voterregisterWidgetState createState() => new _voterregisterWidgetState();
}

class _voterregisterWidgetState extends State<voterregisterWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget fullname_textfield(
    BuildContext context, TextEditingController txtfullname_F) {
  return TextFormField(
    controller: txtfullname_F,
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
Widget Dateofbirth_textfield(
    BuildContext context, TextEditingController txtdob_F) {
  return TextFormField(
    readOnly: true,
    controller: txtdob_F,
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
          firstDate: DateTime(1920),
          lastDate: DateTime(2101));
      if (picked != null) {
        dateTime = picked;
        //assign the chosen date to the controller
        txtdob_F.text = DateFormat.yMd().format(dateTime);
      }
    },
  );
}

Widget occupation_textfield(
    BuildContext context, TextEditingController txtoccupation_F) {
  return TextFormField(
    controller: txtoccupation_F,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'Occupation',
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
        return 'Please enter your Occupation';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget phone_textfield(BuildContext context, TextEditingController txtphone_F) {
  return TextFormField(
    controller: txtphone_F,
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

Widget email_textfield(BuildContext context, TextEditingController txtemail_F) {
  return TextFormField(
    controller: txtemail_F,
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
    BuildContext context, TextEditingController txtaddress_F) {
  return TextFormField(
    controller: txtaddress_F,
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

Widget lga_textfield(BuildContext context, TextEditingController txtlga_F) {
  return TextFormField(
    controller: txtlga_F,
    //initialValue: '${postUserModel.post?.phone ?? ""}',
    decoration: InputDecoration(
      labelText: 'LGA/MUNICIPALITY',
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
        return 'Please enter your LGA';
      }
      return null;
    },
    //onSaved: (value) => ,
  );
}

Widget alreadyvoter(BuildContext context) {
  return Center(
      child: Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      child: Text("Already a Voter? Sign In Here",
          style: TextStyle(
              color: fontcolour2, fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () => voterlogin,
    ),
  ));
}
