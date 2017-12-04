//
//  myBoard.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 01.12.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class myBoard {
    var rows = [[UIButton]]()
    var a = 0
    var b = 0
    var puzzleIndex = 0
    var puzzle1 = ["", "", "", "", "B", "C", "C", "", "C", "", "", "", "A", "C", "", "B"]
    var temp0 = [String : Int]()
    var temp1 = [String : Int]()
    var temp2 = [String : Int]()
    var temp3 = [String : Int]()
    func loadPuzzle(clueButton: UIButton) {
        if puzzle1[puzzleIndex] != "" {
            clueButton.setTitle(puzzle1[puzzleIndex], for: .normal)
        }
        puzzleIndex += 1
        if puzzleIndex > 15 {
            puzzleIndex = 0
        }
    }
    
    func highlightYellow(sender: UIButton) {
        a = sender.tag / 10 - 1
        b = sender.tag % 10 - 1
        for i in rows {
            for j in i {
                if j.backgroundColor == UIColor.yellow {
                    j.backgroundColor = UIColor.white
                }
            }
        }
        rows[a][b].backgroundColor = UIColor.yellow
    }
    
    func userInputs(sender: UIButton) {
        //temp.removeAll()
        if rows[a][b].backgroundColor == UIColor.yellow && sender.currentTitle != "?" {
            rows[a][b].setTitle(sender.currentTitle!, for: .normal)
        } else if rows[a][b].backgroundColor == UIColor.yellow {
            rows[a][b].setTitle("", for: .normal)
        }
        checkRowsForDuplicates(certainRow: a)
    }
    
    func checkRowsForDuplicates(certainRow: Int) {
        temp0.removeAll()
        temp1.removeAll()
        temp2.removeAll()
        temp3.removeAll()
        
        rows[0].forEach {temp0[$0.currentTitle!, default: 0] += 1}
        for (element, quantity) in temp0 where element != "" {
            if quantity > 1 {
                for k in rows[0] where k.currentTitle == element {
                    k.backgroundColor = UIColor.red
                }
            } else {
                for k in rows[0] where k.backgroundColor == UIColor.red {
                    k.backgroundColor = UIColor.white
                }
            }
        }
        rows[1].forEach {temp1[$0.currentTitle!, default: 0] += 1}
        for (element, quantity) in temp1 where element != "" {
            if quantity > 1 {
                for k in rows[1] where k.currentTitle == element {
                    k.backgroundColor = UIColor.red
                }
            } else {
                for k in rows[1] where k.backgroundColor == UIColor.red {
                    k.backgroundColor = UIColor.white
                }
            }
        }
        rows[2].forEach {temp2[$0.currentTitle!, default: 0] += 1}
        for (element, quantity) in temp2 where element != "" {
            if quantity > 1 {
                for k in rows[2] where k.currentTitle == element {
                    k.backgroundColor = UIColor.red
                }
            } else {
                for k in rows[2] where k.backgroundColor == UIColor.red {
                    k.backgroundColor = UIColor.white
                }
            }
        }
        rows[3].forEach {temp3[$0.currentTitle!, default: 0] += 1}
        for (element, quantity) in temp3 where element != "" {
            if quantity > 1 {
                for k in rows[3] where k.currentTitle == element {
                    k.backgroundColor = UIColor.red
                }
            } else {
                for k in rows[3] where k.backgroundColor == UIColor.red {
                    k.backgroundColor = UIColor.white
                }
            }
        }
    }
}

var myBoardInstance = myBoard()
