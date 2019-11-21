import UIKit
import Flutter
import t144_transitive_ios_plugin_2

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    print(T144TransitiveIosPlugin_2Plugin.secretNumber())
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
