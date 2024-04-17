import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomMenuWidget extends StatefulWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomMenuWidget({this.selectedIndex, required this.onClicked});

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onClicked,
      selectedItemColor: AppColor,
      unselectedItemColor: itemcolor,
      backgroundColor: primaryColor,
      unselectedFontSize: 13,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Vote",
          icon: Icon(Icons.how_to_vote_outlined),
        ),
        BottomNavigationBarItem(
          label: "Statistic",
          icon: Icon(Icons.bar_chart),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
