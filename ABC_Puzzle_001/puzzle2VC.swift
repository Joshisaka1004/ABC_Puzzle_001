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
    var question = [0, 0, 0, 0, 0, 0, 2, -1, -1, -1, -1, 3, 3, -1, -1, -1, -1, 0, 3, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, 0, 0, 1, 3, 0, 2, 0]
    var solution = [2, 1, -2, 3, 3, 2, 1, -2, -2, 3, 2, 1, 1, -2, 3, 2]
    override func viewDidLoad() {
        super.viewDidLoad()
        giveTagsToButtons()
        fillGridLines()
        showPuzzleTask()
    }

    // 6:
    func giveTagsToButtons() {
        for k in 0...5 {
            stack1.append(k)
        }
        for i in horizontalStacks {
            for j in 0..<(i.subviews as! [UIButton]).count {
                (i.subviews[j] as! UIButton).tag = stack1[j] + increase
                allButtons.append(i.subviews[j] as! UIButton)
            }
            increase += 6
        }
        
    }
    
    func fillGridLines() {
        for i in allButtons where i.tag > 6 && i.tag < 11 {
            boardInstance.gridLine1.append(i)
        }
        for i in allButtons where i.tag > 12 && i.tag < 17 {
            boardInstance.gridLine2.append(i)
        }
        for i in allButtons where i.tag > 18 && i.tag < 23 {
            boardInstance.gridLine3.append(i)
        }
        for i in allButtons where i.tag > 24 && i.tag < 29 {
            boardInstance.gridLine4.append(i)
        }
        allFourGridLines = boardInstance.gridLine1 + boardInstance.gridLine2 + boardInstance.gridLine3 + boardInstance.gridLine4
    }
    
    func showPuzzleTask() {
        for i in allButtons {
            if question[i.tag] == 0 || question[i.tag] == -1 {
                i.setTitle("", for: .normal)
            } else if question[i.tag] == 1 {
                i.setTitle("A", for: .normal)
            } else if question[i.tag] == 2 {
                i.setTitle("B", for: .normal)
            } else if question[i.tag] == 3 {
                i.setTitle("C", for: .normal)
            } else if question[i.tag] == 4 {
                i.setTitle("D", for: .normal)
            }
        }
    }
    
    @IBAction func gridButtons(_ sender: UIButton) {
        for j in allButtons {
            if allFourGridLines.contains(j) {
                j.isUserInteractionEnabled = true
                if j.backgroundColor == UIColor.yellow {
                    j.backgroundColor = UIColor.white
                }
                allButtons[sender.tag].backgroundColor = UIColor.yellow
            } else {
                j.isUserInteractionEnabled = false
            }
        }
        
    }

    @IBAction func letterButtons(_ sender: UIButton) {
        temp = 4
        for i in allButtons where i.backgroundColor == UIColor.yellow {
            i.setTitle(sender.currentTitle!, for: .normal)
            checkDoublesInstance.temp = 4
            if checkDoublesInstance.checkerForDoubles(param: i, gridLine1Contents: &gridLine1Contents) {
                errorLabel.text = ""
            } else {
                errorLabel.text = "Doppelter Eintrag in Zeile 1"
            }
        }
        
    }
}
