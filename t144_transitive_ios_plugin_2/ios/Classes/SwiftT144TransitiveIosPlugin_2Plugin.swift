import Flutter
import UIKit

public class SwiftT144TransitiveIosPlugin_2Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "t144_transitive_ios_plugin_2", binaryMessenger: registrar.messenger())
    let instance = SwiftT144TransitiveIosPlugin_2Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public static func secretNumber() -> Int {
    return 42
  }
}
