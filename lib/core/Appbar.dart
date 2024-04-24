import 'package:e_voting_2fa_biometric/core/colour/color.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  /// final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
    //required this.widgets, required List<IconButton> actions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: primaryColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: title,
      backgroundColor: AppColor,
      //actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
