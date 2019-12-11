//
//  ViewController.swift
//  t147_add_to_app_ios_demo
//
//  Created by Xiao Yu on 22/11/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

  lazy var engine: FlutterEngine = FlutterEngine(name: "my engine", project: nil)

  override func viewDidLoad() {
    super.viewDidLoad()
    engine.run(withEntrypoint: nil)
  }
  
  @IBAction func launchFlutter(_ sender: Any) {
    let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
    present(flutterViewController, animated: true, completion: nil)
  }
}

