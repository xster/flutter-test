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
        flutterViewController.view.translatesAutoresizingMaskIntoConstraints = false
        flutterViewController.view.topAnchor.constraint(equalTo: flutterContainer.topAnchor, constant: 0).isActive = true
        flutterViewController.view.bottomAnchor.constraint(equalTo: flutterContainer.bottomAnchor, constant: 0).isActive = true
        flutterViewController.view.leadingAnchor.constraint(equalTo: flutterContainer.leadingAnchor, constant: 0).isActive = true
        flutterViewController.view.trailingAnchor.constraint(equalTo: flutterContainer.trailingAnchor, constant: 0).isActive = true
        
        flutterViewController.didMove(toParent: self)
    }


}

