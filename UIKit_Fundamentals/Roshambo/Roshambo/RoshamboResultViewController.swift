//
//  RoshamboResultViewController.swift
//  Roshambo
//
//  Created by Duk on 2018. 8. 23..
//  Copyright © 2018년 Duk. All rights reserved.
//

import UIKit

class RoshamboResultViewController: UIViewController {
    var userChoice: Roshambo?
    var opponentChoice: Roshambo?
    
    @IBOutlet var userChoiceImageView: UIImageView!
    @IBOutlet var opponentChoiceImageView: UIImageView!
    @IBOutlet var resultImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        // User
        if let userChoice = self.userChoice {
            let opponentChoice = getOpponentChoice()
            setImage(view: opponentChoiceImageView, type: opponentChoice)
            setImage(view: userChoiceImageView, type: userChoice)
            setResult(userChoice: userChoice, opponentChoice: opponentChoice)
        }
    }
    
    func setImage(view: UIImageView, type: Roshambo) {
        switch type {
        case Roshambo.rock:
            view.image = #imageLiteral(resourceName: "rock.png")
        case Roshambo.scissors:
            view.image = #imageLiteral(resourceName: "scissors.png")
        case Roshambo.paper:
            view.image = #imageLiteral(resourceName: "paper.png")
        }
    }
    
    func getOpponentChoice() -> Roshambo {
        // Generate a random Int32 using arc4Random
        let randomValue = arc4random() % 3
        switch randomValue {
        case 0:
            return Roshambo.rock
        case 1:
            return Roshambo.scissors
        case 2:
            return Roshambo.paper
        default:
            return Roshambo.paper
        }
    }
    
    func setResult(userChoice: Roshambo, opponentChoice: Roshambo) {
//        print("userChoice:\(userChoice), opponentChoice:\(opponentChoice)")
        switch (userChoice, opponentChoice) {
        case let (user, opponent) where user == opponent:
            resultImageView.image = #imageLiteral(resourceName: "itsATie.png")
        case (.rock, .scissors), (.scissors, .rock):
            resultImageView.image = #imageLiteral(resourceName: "RockCrushesScissors.jpeg")
        case (.scissors, .paper), (.paper, .scissors):
            resultImageView.image = #imageLiteral(resourceName: "ScissorsCutPaper.jpg")
        case (.paper, .rock), (.rock, .paper):
            resultImageView.image = #imageLiteral(resourceName: "PaperCoversRock.jpg")
        default:
            // Do Nothing
            break
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
