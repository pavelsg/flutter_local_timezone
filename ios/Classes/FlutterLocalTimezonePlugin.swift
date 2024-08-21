import Flutter
import UIKit

public class FlutterLocalTimezonePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_local_timezone", binaryMessenger: registrar.messenger())
    let instance = FlutterLocalTimezonePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getLocalTimezone" {
      let timeZone = TimeZone.current.identifier
      result(timeZone)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
