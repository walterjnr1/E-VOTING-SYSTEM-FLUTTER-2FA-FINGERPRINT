import 'package:local_auth/local_auth.dart';

class Authentication {
//this is the logic of the App
  static final _auth = LocalAuthentication();
  static Future<bool> canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

     static Future<bool> authentication() async {
          try {
            if (!await canAuthenticate()) return false;
            return await _auth.authenticate(localizedReason: "Verify identity to Access E-voting module");
          } catch (e) {
            print('error $e');
            return false;
          }
        }

}
