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
        if rows[a][b].backgroundColor == UIColor.yellow && sender.currentTitle != "?" {
            rows[a][b].setTitle(sender.currentTitle!, for: .normal)
        } else if rows[a][b].backgroundColor == UIColor.yellow {
            rows[a][b].setTitle("", for: .normal)
        }
    }
    
}
var myBoardInstance = myBoard()
