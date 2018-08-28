//
//  ViewController.swift
//  Roshambo
//
//  Created by Duk on 2018. 8. 22..
//  Copyright © 2018년 Duk. All rights reserved.
//

import UIKit

class RoshamboMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func chooseRock(_ sender: UIButton) {
        var controller: RoshamboResultViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "RoshamboResultViewController")
            as! RoshamboResultViewController
        
        controller.userChoice = getRoshambo(button: sender)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func choosePaper(_ sender: UIButton) {
        performSegue(withIdentifier: "selected", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selected" {
            let controller = segue.destination as! RoshamboResultViewController
            controller.userChoice = getRoshambo(button: (sender as! UIButton))
        }
    }
    
    func getRoshambo(button: UIButton) -> Roshambo {
        let title = button.title(for: UIControlState())!
        return Roshambo(rawValue: title)!
    }
}

