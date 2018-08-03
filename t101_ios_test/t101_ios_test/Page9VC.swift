//
//  Page4VC.swift
//  t101_ios_test
//
//  Created by Xiao Yu on 7/31/18.
//  Copyright © 2018 Xiao Yu. All rights reserved.
//

import UIKit

class Page9VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func backTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}
