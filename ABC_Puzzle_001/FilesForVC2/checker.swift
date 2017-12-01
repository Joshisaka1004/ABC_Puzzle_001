//
//  checker.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 28.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class checker {
    
    var gridLine1Contents = ["1", "2", "3", "4"]
    var gridLine2Contents = ["1", "2", "3", "4"]
    var gridLine3Contents = ["1", "2", "3", "4"]
    var gridLine4Contents = ["1", "2", "3", "4"]
    var userSolution = [String]()
    var checkingArray = [7, 13, 19, 25]
    var checkingArray2 = [8, 14, 20, 26]
    var checkingArray3 = [9, 15, 21, 27]
    var checkingArray4 = [10, 16, 22, 28]
    var col1 = ["1", "2", "3", "4"]
    var col2 = ["1", "2", "3", "4"]
    var col3 = ["1", "2", "3", "4"]
    var col4 = ["1", "2", "3", "4"]
    var allCols = [[String]]()
    var spalte = 0
    var solution1 = [2, 1, -6, 3, 3, 2, 1, -8, -2, 3, 2, 1, 1, -4, 3, 2]
    var solution1b = [String]()
    var solution1c = [String]()
    func checkerForDoubles(param: UIButton) -> Int {
        if param.tag > 6 && param.tag < 11 {
            gridLine1Contents[param.tag - 7] = param.currentTitle!
            if Set(gridLine1Contents).count != 4 {
                return 1
            } else {
                return 0
            }
        } else if param.tag > 12 && param.tag < 17 {
            gridLine2Contents[param.tag - 13] = param.currentTitle!
            if Set(gridLine2Contents).count != 4 {
                return 2
            } else {
                return 0
            } 
        } else if param.tag > 18 && param.tag < 23 {
            gridLine3Contents[param.tag - 19] = param.currentTitle!
            if Set(gridLine3Contents).count != 4 {
                return 3
            } else {
                return 0
            }
        } else {
            gridLine4Contents[param.tag - 25] = param.currentTitle!
            if Set(gridLine4Contents).count != 4 {
                return 4
            } else {
                return 0
            }
        }
    }
    
    func checkforDoublesInCols(param: UIButton) -> Int {
        spalte = 0
        allCols.removeAll()
        
        for i in 0..<checkingArray.count where checkingArray[i] == param.tag {
            col1[i] = param.currentTitle!
        }
        
        for i in 0..<checkingArray2.count where checkingArray2[i] == param.tag {
            col2[i] = param.currentTitle!
        }
        
        for i in 0..<checkingArray3.count where checkingArray3[i] == param.tag {
            col3[i] = param.currentTitle!
        }
        
        for i in 0..<checkingArray4.count where checkingArray4[i] == param.tag {
            col4[i] = param.currentTitle!
        }
        allCols.append(contentsOf: [col1, col2, col3, col4])
        for k in 0..<allCols.count {
            if Set(allCols[k]).count != 4 {
                spalte = k
                return spalte + 5
            }
        }
        return 0
    }
    
    func solPrepare() {
        solution1b.removeAll()
        for i in 0..<solution1.count {
            solution1b.append(String(solution1[i]))
            solution1c.append(String(solution1[i]))
        }
        for j in 0..<solution1b.count {
            if solution1b[j] == "1" {
                solution1b[j] = "A"
                solution1c[j] = "A"
            } else if solution1b[j] == "2" {
                solution1b[j] = "B"
                solution1c[j] = "B"
            } else if solution1b[j] == "3" {
                solution1b[j] = "C"
                solution1c[j] = "C"
            } else {
                solution1b[j] = "\((Int(solution1b[j])! / -2))"
                solution1c[j] = "X"
            }
        }
    }
    
    func entireSolution() -> Bool {
        userSolution = gridLine1Contents + gridLine2Contents + gridLine3Contents + gridLine4Contents
        
        if userSolution == solution1b || userSolution == solution1c {
            return true
        }
        return false
    }
}
var checkDoublesInstance = checker()
