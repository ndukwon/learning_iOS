//
//  ViewController.swift
//  ColorMakerWithSlider
//
//  Created by Dukwon Nam on 2018. 8. 1..
//  Copyright © 2018년 Dukwon Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorMixView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func updateColor() {
        let r = CGFloat(self.redSlider.value)
        let g = CGFloat(self.greenSlider.value)
        let b = CGFloat(self.blueSlider.value)
        
        colorMixView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

