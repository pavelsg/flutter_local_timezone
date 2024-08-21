import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_local_timezone/flutter_local_timezone.dart';

/// The web implementation of the FlutterLocalTimezone plugin.
class FlutterLocalTimezoneWeb {
  static void registerWith(Registrar registrar) {
    // No additional logic is needed since `kIsWeb` is handled in flutter_local_timezone.dart
  }
}
