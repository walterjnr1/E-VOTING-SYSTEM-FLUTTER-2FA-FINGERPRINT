import 'package:e_voting_2fa_biometric/core/services/internet_connection.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_candidate.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/fingerprint.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/login.dart';
import 'package:e_voting_2fa_biometric/features/auth/Presentation/screens/register_candidate.dart';
import 'package:e_voting_2fa_biometric/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:e_voting_2fa_biometric/features/splash_view/splashview.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/GovernorCandidates.dart';
import 'package:e_voting_2fa_biometric/features/vote/Presentation/screens/PresidentCandidates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataClassVoter()),
        ChangeNotifierProvider(create: (context) => DataClassCandidate()),
        ChangeNotifierProvider(create: (context) => InternetConnectionProvider()),
                 ],
        child: MyApp(),
        ),
        );
  
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
       // '/': (context) => SplashView(),
       '/': (context) => BottomMenu(),

      },
    );
  }
}
