import Flutter
import UIKit
import t144_transitive_ios_plugin_2

public class SwiftT144TransitiveIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "t144_transitive_ios_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftT144TransitiveIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    print(T144TransitiveIosPlugin_2Plugin.secretNumber())
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
