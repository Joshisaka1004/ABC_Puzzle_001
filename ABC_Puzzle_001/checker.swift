//
//  checker.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 28.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class checker {
    var temp = 0
    func checkerForDoubles(param: UIButton, gridLine1Contents: inout [String]) -> Bool {
        if param.tag > 6 && param.tag < 11 {
            gridLine1Contents[param.tag - 7] = param.currentTitle!
            for k in gridLine1Contents where k == "0" {
                temp -= 1
            }
            if Set(gridLine1Contents).count != temp + 1 && Set(gridLine1Contents).count != 4 {
                return false
            } else {
                return true
            }
        }
        return true
    }
}
var checkDoublesInstance = checker()
