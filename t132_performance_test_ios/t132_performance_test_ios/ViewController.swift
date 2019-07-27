//
//  ViewController.swift
//  t132_performance_test_ios
//
//  Created by Xiao Yu on 17/7/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  lazy var engine: FlutterEngine = FlutterEngine(name: "performance test", project: nil)

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func initEngine(_ sender: Any) {
    let start = NSDate()
    print("Engine \(engine) took \(-start.timeIntervalSinceNow) to make")
  }
  
  @IBAction func loadVm(_ sender: Any) {
    let start = NSDate()
    engine.createShell(nil)
    print("VM took \(-start.timeIntervalSinceNow) to create")
  }
  
  @IBAction func loadEngine(_ sender: Any) {
    let start = NSDate()
    engine.run(withEntrypoint: nil)
    print("Entrypoint took \(-start.timeIntervalSinceNow) to create")
  }

  @IBAction func showVC(_ sender: Any) {
    let start = NSDate()
    let fvc = FlutterViewController.init(engine: engine, nibName: nil, bundle: nil)!
    fvc.setFlutterViewDidRenderCallback({
      print("First frame took \(-start.timeIntervalSinceNow) to render")
    })
    present(fvc, animated: true, completion: nil)
  }
}

