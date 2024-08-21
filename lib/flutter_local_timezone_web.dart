import 'dart:async';
import 'dart:html' as html;

class FlutterLocalTimezoneWeb {
  Future<String> getLocalTimezone() async {
    return html.window.navigator.language.isEmpty
        ? "UTC"
        : html.window.navigator.language;
  }
}
