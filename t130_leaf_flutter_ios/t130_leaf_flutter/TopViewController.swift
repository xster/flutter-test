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

  weak var flutterEngine: FlutterEngine?
  var channel: FlutterMethodChannel?


  override func viewDidLoad() {
    super.viewDidLoad()
    flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
    channel = FlutterMethodChannel(name: "slider", binaryMessenger: flutterEngine!)
    channel?.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in

      update(sliderValue: call.arguments)
    })
  }

  func update(sliderValue: Float) {
    progressView.setProgress(sliderValue, animated: true)
    progressLabel.text = String(sliderValue)
  }

  @IBAction func nativeChangeSliderValue(_ sender: UISlider) {
    update(sliderValue: sender.value)
  }

  @IBAction func buttonTapped(_ sender: Any) {
    let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine
    let flutterViewController = LeafFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
    self.navigationController?.pushViewController(flutterViewController, animated: true)
  }
}

