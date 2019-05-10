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
  
  weak var flutterEngine: FlutterEngine?
  var channel: FlutterMethodChannel?


  override func viewDidLoad() {
    super.viewDidLoad()
    flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
    channel = FlutterMethodChannel(name: "slider", binaryMessenger: flutterEngine!)
    channel?.setMethodCallHandler({
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
  }

  func update(sliderValue: Float) {
    progressView.setProgress(sliderValue, animated: true)
    progressLabel.text = String(sliderValue)
    progressSlider.setValue(sliderValue, animated: true)
  }

  @IBAction func nativeChangeSliderValue(_ sender: UISlider) {
    update(sliderValue: sender.value)
  }

  @IBAction func buttonTapped(_ sender: Any) {
    let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
    channel?.invokeMethod("send", arguments: progressView.progress)
    
    let flutterViewController = LeafFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
    self.navigationController?.pushViewController(flutterViewController, animated: true)
  }
}

