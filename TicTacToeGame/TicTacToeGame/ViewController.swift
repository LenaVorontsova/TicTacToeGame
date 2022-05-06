//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Admin on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    enum Turn {
        case Nought
        case Cross
    }
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var nought = "O"
    var cross = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
    }
    
    func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal)==nil) {
            if(currentTurn == Turn.Nought) {
                sender.setTitle(nought, for: .normal)
                sender.setTitleColor(.black, for: .normal)
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
                currentTurn = Turn.Cross
                turnLabel.text = cross
            } else if(currentTurn == Turn.Cross) {
                sender.setTitle(cross, for: .normal)
                sender.setTitleColor(.black, for: .normal)
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
                currentTurn = Turn.Nought
                turnLabel.text = nought
            }
        }
    }
    
}

