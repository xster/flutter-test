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

  @IBAction func armEngine1(_ sender: Any) {
    if flutterEngine == nil {
      let start = NSDate()
      let delegate = (UIApplication.shared.delegate as? AppDelegate)!
      flutterEngine = delegate.flutterEngine

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
        self.update(sliderValue: value.floatValue)
      })
      print("arming engine 1 took \(-start.timeIntervalSinceNow)")
    }
  }

  @IBAction func armEngine2(_ sender: Any) {
    if flutterEngine2 == nil {
      let start = NSDate()
      let delegate = (UIApplication.shared.delegate as? AppDelegate)!
      flutterEngine2 = delegate.flutterEngine2
      
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
        self.nativeSwitch.setOn(value, animated: true)
      })
      
      let inlineFVC = FlutterViewController(engine: flutterEngine2, nibName: nil, bundle: nil)!
      inlineFVC.setFlutterViewDidRenderCallback({
        print("drawing out of engine 2 took \(-start.timeIntervalSinceNow)")
      })
      self.addChild(inlineFVC)
      self.inlineFlutterContainer.addSubview(inlineFVC.view)
      
      inlineFVC.view.translatesAutoresizingMaskIntoConstraints = false
      inlineFVC.view.topAnchor.constraint(equalTo: inlineFlutterContainer.topAnchor, constant: 0).isActive = true
      inlineFVC.view.bottomAnchor.constraint(equalTo: inlineFlutterContainer.bottomAnchor, constant: 0).isActive = true
      inlineFVC.view.leadingAnchor.constraint(equalTo: inlineFlutterContainer.leadingAnchor, constant: 0).isActive = true
      inlineFVC.view.trailingAnchor.constraint(equalTo: inlineFlutterContainer.trailingAnchor, constant: 0).isActive = true
      
      inlineFVC.didMove(toParent: self)
      print("arming engine 2 took \(-start.timeIntervalSinceNow)")
    }
  }

  @IBAction func buttonTapped(_ sender: Any) {
    if flutterEngine == nil {
      print("engine 1 not initialized yet so cannot launch flutter")
      return
    }

    sliderChannel?.invokeMethod("send", arguments: progressView.progress)
    let flutterViewController = LeafFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
    self.navigationController?.pushViewController(flutterViewController, animated: true)
  }
}

