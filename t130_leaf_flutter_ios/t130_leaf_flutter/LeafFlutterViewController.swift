//
//  LeafFlutterViewController.swift
//  t130_leaf_flutter
//
//  Created by Xiao Yu on 9/5/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import UIKit
import Flutter

class LeafFlutterViewController: FlutterViewController {
  override func viewWillAppear(_ animated: Bool) {
    let start = NSDate()
    self.setFlutterViewDidRenderCallback({
      print("delay from viewWillAppear \(-start.timeIntervalSinceNow) before rendering")
    })
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    super.viewWillDisappear(animated)
  }
}
