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
}
var checkDoublesInstance = checker()
