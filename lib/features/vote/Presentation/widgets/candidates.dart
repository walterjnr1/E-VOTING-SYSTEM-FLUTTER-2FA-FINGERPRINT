import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/vote.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class candidatesWidget extends StatefulWidget {
  @override
  _candidatesWidgetState createState() => new _candidatesWidgetState();
}

class _candidatesWidgetState extends State<candidatesWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

Widget candidate1(BuildContext context) {
  return GestureDetector(
      onTap: () {
        // Add your callback here
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Vote()));
      },
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7MWIy_Iss57Ze_a6xaRn0-kRV0TjK_vnHz8E6kXahHjGxBznSZIDl2U&s',
                      width: 171,
                      height: 131,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOViKPknEOrvcQASPgXJQ9dGYWtXxgNScG2CxVaqHD85c-v5eqsOZUmTA&s',
                        width: 40,
                        height: 40,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Peter Obi (LP)',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Votes: 6,700',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: fontcolour2, letterSpacing: .5),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ));
}
