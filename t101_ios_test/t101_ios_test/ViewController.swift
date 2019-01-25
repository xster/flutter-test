//
//  ViewController.swift
//  t101_ios_test
//
//  Created by Xiao Yu on 7/17/18.
//  Copyright © 2018 Xiao Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

@IBDesignable class MyButton: UIButton
{
  override func layoutSubviews() {
    super.layoutSubviews()

    updateCornerRadius()
  }

  @IBInspectable var rounded: Bool = false {
    didSet {
      updateCornerRadius()
    }
  }

  func updateCornerRadius() {
    layer.cornerRadius = rounded ? 30 : 0
    layer.continuousCorners = true
  }
}
