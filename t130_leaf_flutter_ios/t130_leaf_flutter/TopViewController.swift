//
//  ViewController.swift
//  t130_leaf_flutter
//
//  Created by Xiao Yu on 6/5/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import UIKit
import Flutter

class TopViewController: UIViewController {

  @IBOutlet weak var progressLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var progressSlider: UISlider!
  @IBOutlet weak var inlineFlutterContainer: UIView!
  @IBOutlet weak var nativeSwitch: UISwitch!

  weak var flutterEngine: FlutterEngine?
  weak var flutterEngine2: FlutterEngine?
  var sliderChannel: FlutterMethodChannel?
  var switchChannel: FlutterMethodChannel?

  override func viewDidLoad() {
    super.viewDidLoad()
    let delegate = (UIApplication.shared.delegate as? AppDelegate)!
    flutterEngine = delegate.flutterEngine
    flutterEngine2 = delegate.flutterEngine2

    sliderChannel = FlutterMethodChannel(name: "slider", binaryMessenger: flutterEngine!)
    sliderChannel?.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "return" else {
        result(FlutterMethodNotImplemented)
        return
      }
      
      guard let value = call.arguments as? NSNumber else {
        result(FlutterError.init(code: "invalid_argument", message: nil, details: nil))
        return
      }
      print("returned \(String(describing: value))")
      self.update(sliderValue: value.floatValue)
    })

    switchChannel = FlutterMethodChannel(name: "switch", binaryMessenger: flutterEngine2!)
    switchChannel?.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "return" else {
        result(FlutterMethodNotImplemented)
        return
      }

      guard let value = (call.arguments as? NSNumber)?.boolValue else {
        result(FlutterError.init(code: "invalid_argument", message: nil, details: nil))
        return
      }
      print("swift returned switch \(String(describing: value))")
      self.nativeSwitch.setOn(value, animated: true)
    })

    let inlineFVC = FlutterViewController(engine: flutterEngine2, nibName: nil, bundle: nil)!
    self.addChild(inlineFVC)
    inlineFVC.view.frame = inlineFlutterContainer.frame
    self.inlineFlutterContainer.addSubview(inlineFVC.view)
    inlineFVC.didMove(toParent: self)
    print("flutter frame \(inlineFVC.view.frame)")
    print("native frame \(inlineFlutterContainer.frame)")
  }

  func update(sliderValue: Float) {
    progressView.setProgress(sliderValue, animated: true)
    progressLabel.text = String(sliderValue)
    progressSlider.setValue(sliderValue, animated: true)
  }

  @IBAction func nativeChangeSliderValue(_ sender: UISlider) {
    update(sliderValue: sender.value)
  }

  @IBAction func nativeChangeSwitchValue(_ sender: UISwitch) {
    switchChannel?.invokeMethod("send", arguments: nativeSwitch.isOn)
  }

  @IBAction func buttonTapped(_ sender: Any) {
    let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
    sliderChannel?.invokeMethod("send", arguments: progressView.progress)
    
    let flutterViewController = LeafFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
    self.navigationController?.pushViewController(flutterViewController, animated: true)
  }
}

