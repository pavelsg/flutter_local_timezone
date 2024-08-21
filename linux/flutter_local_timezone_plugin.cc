#include <flutter_linux/flutter_linux.h>
#include <sys/time.h>
#include <ctime>

static void flutter_local_timezone_handle_method_call(
    FlMethodChannel* channel,
    FlMethodCall* method_call,
    gpointer user_data) {
  const gchar* method = fl_method_call_get_name(method_call);

  if (strcmp(method, "getLocalTimezone") == 0) {
    time_t t = time(nullptr);
    struct tm* local_tm = localtime(&t);
    gchar* timezone_name = g_strdup(local_tm->tm_zone);
    fl_method_call_respond_success(method_call, g_variant_new_string(timezone_name), nullptr);
    g_free(timezone_name);
  } else {
    fl_method_call_respond_not_implemented(method_call, nullptr);
  }
}

void flutter_local_timezone_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  FlMethodChannel* channel = fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                                                   "flutter_local_timezone",
                                                   FL_METHOD_CODEC_TEXT,
                                                   nullptr);

  fl_method_channel_set_method_call_handler(channel, flutter_local_timezone_handle_method_call, nullptr, nullptr);
}
