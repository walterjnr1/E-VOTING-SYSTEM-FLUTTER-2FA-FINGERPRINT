import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';

class voteWidget extends StatefulWidget {
  @override
  _voteWidgetState createState() => new _voteWidgetState();
}

class _voteWidgetState extends State<voteWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget mycandidate(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 4,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7MWIy_Iss57Ze_a6xaRn0-kRV0TjK_vnHz8E6kXahHjGxBznSZIDl2U&s',
            height: 311,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        ListTile(
          title: const Text(
            'Peter Obi',
            style: TextStyle(
                color: fontcolour2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Text('LP',
              style: TextStyle(
                  color: fontcolour2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOViKPknEOrvcQASPgXJQ9dGYWtXxgNScG2CxVaqHD85c-v5eqsOZUmTA&s'),
        ),
        SizedBox(
          height: 11,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: AppColor,
                minimumSize: Size(MediaQuery.of(context).size.width, 56)),
            child: const Text(
              'Vote',
              style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
