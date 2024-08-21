import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'flutter_local_timezone_web.dart';

class FlutterLocalTimezoneWeb {
  static void registerWith(Registrar registrar) {
    // Register the plugin with the web registrar
    final instance = FlutterLocalTimezoneWeb();
    // Set the method to handle timezone request from web
  }

  Future<String?> getLocalTimezone() {
    return FlutterLocalTimezone().getLocalTimeZone();
  }
}

