//
//  puzzle2VC.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 27.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class puzzle2VC: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    // 1: Alle sechs horizontalen StackViews, in 6: benutzt für die programmatische Zuweisung von Tags an die Buttons
    @IBOutlet var horizontalStacks: [UIStackView]!
    // 2: Alle 36 Buttons, das muss in künftigen Versionen modifiziert werden, die Elemente um das eigentliche Rätselgitter herum müssen keine Buttons sein, Labels tun es hier auch.
    var allButtons = [UIButton]()
    // 3: Wird alsbald mit Integern von 0 bis 5 gefüllt -> als Indexierungshilfe für die Tagvergabe unter 6:
    var stack1 = [Int]()
    var increase = 0 //erhöht die Tag-Werte um jeweils 6, s.u. 6:
    var temp = 4
    // 4: Die vier Zeilen der Lösungreihen und alle 4 Reihen in einem Array
    var gridLine1Contents = ["0", "0", "0", "0"]
    var gridLine1 = [UIButton]()
    var gridLine2 = [UIButton]()
    var gridLine3 = [UIButton]()
    var gridLine4 = [UIButton]()
    var allFourGridLines = [UIButton]()
    
    // 5: Die Aufgabenstellung question: "0" = kein Clue, "1" = A, "2" = B, "3" = C; die -1 bedeuted keine ANgabe im Rätselgitter selbst; die Lösung solution entählt neben 1,2,3 für A,B,C auch -2 für das "X" in der Lösung, also das eine Leerkästchen pro Zeile
    //var question1 = [0, 0, 0, 0, 0, 0, 2, -1, -1, -1, -1, 3, 3, -1, -1, -1, -1, 0, 3, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, 0, 0, 1, 3, 0, 2, 0]
    var solution1 = [2, 1, -2, 3, 3, 2, 1, -2, -2, 3, 2, 1, 1, -2, 3, 2]
    override func viewDidLoad() {
        super.viewDidLoad()
        boardInstance.tagsForAllButtons(horizontalStacks: horizontalStacks)
        boardInstance.tagsForPuzzleRows()
        showPuzzleTask()
    }
    func showPuzzleTask() {
        puzzleLoadInstance.load(loadCertainP: 0)
    }

    @IBAction func gridButtons(_ sender: UIButton) {
        boardInstance.highlightYellow(sender: sender)
        
    }
    @IBAction func letterButtons(_ sender: UIButton) {
        switch boardInstance.userInputs(sender: sender) {
        case 1:
            errorLabel.text = "Zeile 1 hat Duplikate"
        case 2:
            errorLabel.text = "Zeile 2 hat Duplikate"
        case 3:
            errorLabel.text = "Zeile 3 hat Duplikate"
        case 4:
            errorLabel.text = "Zeile 4 hat Duplikate"
        default:
            errorLabel.text = ""
        }
    }
}
