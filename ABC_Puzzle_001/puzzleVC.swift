//
//  puzzleVC.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 27.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class puzzleVC: UIViewController {

    @IBOutlet weak var verticalStack: UIStackView!
    var stack1 = [Int]()
    var increase = 0
    @IBOutlet var horizontalStacks: [UIStackView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        giveTagsToButtons()
        checkDoublesInstance.solPrepare()
    }

    func giveTagsToButtons() {
        for k in 0...5 {
            stack1.append(k)
        }
        for i in horizontalStacks {
            for j in 0..<(i.subviews as! [UIButton]).count {
                (i.subviews[j] as! UIButton).tag = stack1[j] + increase
            }
            increase += 6
        }
    }
    
    @IBAction func myB1(_ sender: UIButton) {
        
    }
}
