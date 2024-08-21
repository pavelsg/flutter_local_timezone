import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

class FlutterLocalTimezone {
  static const MethodChannel _channel =
      MethodChannel('flutter_local_timezone');

  static Future<String?> getLocalTimezone() async {
    if (kIsWeb) {
      return _getTimezoneForWeb();
    } else {
      final String? timezone = await _channel.invokeMethod('getLocalTimezone');
      return timezone;
    }
  }

  // Web-specific implementation
  static String _getTimezoneForWeb() {
    return DateTime.now().timeZoneName;
  }
}
