import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

import 'flutter_local_timezone_web.dart'
    if (dart.library.io) 'flutter_local_timezone_mobile.dart';

class FlutterLocalTimezone {
  static Future<String?> getLocalTimezone() async {
    if (kIsWeb) {
      return FlutterLocalTimezoneWeb().getLocalTimezone();
    } else {
      const MethodChannel _channel = MethodChannel('flutter_local_timezone');
      final String? timezone = await _channel.invokeMethod('getLocalTimezone');
      return timezone;
    }
  }
}
