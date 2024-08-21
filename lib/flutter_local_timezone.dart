import 'dart:async';
import 'package:flutter/services.dart';

class FlutterLocalTimezone {
  static const MethodChannel _channel =
      MethodChannel('flutter_local_timezone');

  static Future<String?> getLocalTimezone() async {
    final String? timezone = await _channel.invokeMethod('getLocalTimezone');
    return timezone;
  }
}
