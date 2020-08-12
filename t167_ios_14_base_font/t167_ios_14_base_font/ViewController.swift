//
//  ViewController.swift
//  t167_ios_14_base_font
//
//  Created by Xiao Yu on 20/8/11.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    @IBOutlet weak var flutterContainer: UIView!
    let flutterEngine = FlutterEngine(name: "blah")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flutterEngine.run()
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        addChild(flutterViewController)
        flutterContainer.addSubview(flutterViewController.view)
        flutterViewController.view.frame = flutterContainer.bounds
        flutterViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        flutterViewController.didMove(toParent: self)
    }


}

