//
//  ViewController.swift
//  ClickCounter
//
//  Created by Dukwon Nam on 2018. 7. 30..
//  Copyright © 2018년 Dukwon Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ex1_addViewsProgrammatically()
    }
    
    func ex1_addViewsProgrammatically() {
        // label
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        view.addSubview(label)
        self.label = label
        
        // button
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        // button2
        let button2 = UIButton()
        button2.frame = CGRect(x: 250, y: 250, width: 60, height: 60)
        button2.setTitle("Click", for: .normal)
        button2.setTitleColor(UIColor.blue, for: .normal)
        button2.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        view.addSubview(button2)
    }
    
    /*
     When assigning a button’s action in code, you will need to mark the function with @objc as we did in incrementCount().
     */
    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
    
    @IBAction func decrementCount() {
        self.count -= 1
        self.label.text = "\(self.count)"
    }
}

