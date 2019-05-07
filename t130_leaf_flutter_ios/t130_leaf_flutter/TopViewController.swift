//
//  ViewController.swift
//  t130_leaf_flutter
//
//  Created by Xiao Yu on 6/5/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

  @IBOutlet weak var progressLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func nativeChangeSliderValue(_ sender: UISlider) {
    progressView.setProgress(sender.value, animated: true)
    progressLabel.text = String(sender.value)
  }

}
