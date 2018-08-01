//
//  Page4VC.swift
//  t101_ios_test
//
//  Created by Xiao Yu on 7/31/18.
//  Copyright © 2018 Xiao Yu. All rights reserved.
//

import UIKit

class Page4VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func backTap(_ sender: Any) {
    performSegue(withIdentifier: "unwindToPage3", sender: self)
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
