//
//  Board.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 28.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class Board {
    var stack1 = [Int]()
    var increase = 0
    var allButtons = [UIButton]()
    var gridLine1 = [UIButton]()
    var gridLine2 = [UIButton]()
    var gridLine3 = [UIButton]()
    var gridLine4 = [UIButton]()
    var gridLine1Contents = ["0", "0", "0", "0"]
    var gridLine2Contents = ["0", "0", "0", "0"]
    var gridLine3Contents = ["0", "0", "0", "0"]
    var gridLine4Contents = ["0", "0", "0", "0"]
    var allFourGridLines = [UIButton]()
    func tagsForAllButtons(horizontalStacks: [UIStackView]) {
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
    
    func tagsForPuzzleRows() {
        for i in allButtons where i.tag > 6 && i.tag < 11 {
            gridLine1.append(i)
        }
        for i in allButtons where i.tag > 12 && i.tag < 17 {
            gridLine2.append(i)
        }
        for i in allButtons where i.tag > 18 && i.tag < 23 {
            gridLine3.append(i)
        }
        for i in allButtons where i.tag > 24 && i.tag < 29 {
            gridLine4.append(i)
        }
        allFourGridLines = gridLine1 + gridLine2 + gridLine3 + gridLine4
    }
    
    func highlightYellow(sender: UIButton) {
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
    
    func userInputs(sender: UIButton) -> (Int, Int, Bool) {
        var result = 0
        var result2 = 0
        var result3 = false
        for i in allButtons where i.backgroundColor == UIColor.yellow {
            i.setTitle(sender.currentTitle!, for: .normal)
            result = checkDoublesInstance.checkerForDoubles(param: i)
            result2 = checkDoublesInstance.checkforDoublesInCols(param: i)
            result3 = checkDoublesInstance.entireSolution()
        }
        print(checkDoublesInstance.userSolution)
        return (result, result2, result3)
    }
}

var boardInstance = Board()
