import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/otp.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_candidate.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_voter.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_home.dart';
import 'package:e_voting_2fa_biometric/features/settings/Presentation/screens/settings.dart';
import 'package:e_voting_2fa_biometric/features/splash_view/splashview.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/candidates.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/selectelection.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/vote.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => voterregister(),
        //'/': (context) => settings(),
      },
    ));
