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
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func checkForVictory(_ s: String) -> Bool {
        //Horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        //Vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        //Diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }

        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkForVictory(cross)
        {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        if checkForVictory(nought)
        {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String) {
        let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought
        {
            firstTurn = Turn.Cross
            turnLabel.text = cross
        }
        else if firstTurn == Turn.Cross
        {
            firstTurn = Turn.Nought
            turnLabel.text = nought
        }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
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
            sender.isEnabled = false
        }
    }
    
}

