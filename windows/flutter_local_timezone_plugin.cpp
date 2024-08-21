#include <flutter/plugin_registrar_windows.h>
#include <windows.h>
#include <time.h>

void FlutterLocalTimezonePluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  FlutterMethodChannel* channel = FlutterMethodChannelNew("flutter_local_timezone",
    FL_METHOD_CODEC_TEXT, nullptr);

  FlutterMethodCallHandler handler = [](FlMethodCall* method_call, void* user_data) {
    const char* method_name = fl_method_call_get_name(method_call);

    if (strcmp(method_name, "getLocalTimezone") == 0) {
      TIME_ZONE_INFORMATION tz;
      GetTimeZoneInformation(&tz);
      char buffer[128];
      wcstombs(buffer, tz.StandardName, 128);
      fl_method_call_respond_success(method_call, g_variant_new_string(buffer), nullptr);
    } else {
      fl_method_call_respond_not_implemented(method_call, nullptr);
    }
  };

  fl_method_channel_set_method_call_handler(channel, handler, nullptr, nullptr);
}
