//
//  ViewController.swift
//  MyImagePicker
//
//  Created by Dukwon Nam on 2018. 8. 12..
//  Copyright © 2018년 Dukwon Nam. All rights reserved.
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

    @IBAction func pickPic() {
        let nextController = UIImagePickerController()
        
        present(nextController, animated: true, completion: nil)
    }
    
    @IBAction func sharePic() {
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(nextController, animated: true, completion: nil)
    }

    @IBAction func alert() {
        let nextController = UIAlertController()
        nextController.title = "Test Alert!"
        nextController.message = "This is a test."
        
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.default) {action in
            self.dismiss(animated: true, completion: nil)
        }
        nextController.addAction(alertAction)
        
        present(nextController, animated: true, completion: nil)
    }
}

