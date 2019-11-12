//
//  ViewController.swift
//  t142_import_framework
//
//  Created by Xiao Yu on 11/11/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import Flutter
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func launchFlutter(_ sender: Any) {
    class DeallocFlutterViewController : FlutterViewController {
      deinit {
        print("Flutter view controller deinit")
      }
    }
    let flutterVC = DeallocFlutterViewController(engine: (UIApplication.shared.delegate as! AppDelegate).flutterEngine, nibName: nil, bundle: nil)
    present(flutterVC, animated: true, completion: nil)
  }

}

