//
//  LoadPuzzle.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 28.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class LoadPuzzle {
    var question1 = [0, 0, 0, 0, 0, 0, 2, -1, -1, -1, -1, 3, 3, -1, -1, -1, -1, 0, 3, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, 0, 0, 1, 3, 0, 2, 0]
    var all4x4Puzzles = [[Int]]()
    
    func load(loadCertainP: Int) {
        all4x4Puzzles.append(question1)
        for i in boardInstance.allButtons {
            if all4x4Puzzles[loadCertainP][i.tag] == 0 || all4x4Puzzles[loadCertainP][i.tag] == -1 {
                i.setTitle("", for: .normal)
            } else if all4x4Puzzles[loadCertainP][i.tag] == 1 {
                i.setTitle("A", for: .normal)
            } else if all4x4Puzzles[loadCertainP][i.tag] == 2 {
                i.setTitle("B", for: .normal)
            } else if all4x4Puzzles[loadCertainP][i.tag] == 3 {
                i.setTitle("C", for: .normal)
            } else if all4x4Puzzles[loadCertainP][i.tag] == 4 {
                i.setTitle("D", for: .normal)
            }
        }
    }
}
var puzzleLoadInstance = LoadPuzzle()
