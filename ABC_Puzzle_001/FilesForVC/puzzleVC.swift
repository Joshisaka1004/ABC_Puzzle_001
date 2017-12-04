//
//  puzzleVC.swift
//  ABC_Puzzle_001
//
//  Created by Joachim Vetter on 27.11.17.
//  Copyright © 2017 Joachim Vetter. All rights reserved.
//

import UIKit

class puzzleVC: UIViewController {

    // 1: Alle 16 Buttons im Grid als Outlet-Collection von UIButtons
    @IBOutlet var gridButtonsOutlets: [UIButton]!
    // 2: Die Buttons, die die Clues um das Gitter herum enthalten sollen, ebenflls als Outlet-Collection
    @IBOutlet var taskClues: [UIButton]!
    // 3: Hilfsgröße zur programmatischen Tagzuweisung, Erklärung weiter unten
    var counter = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        giveTags() // Die Funktion, die nach dem Appstart die Tags zuweisens soll
        for j in taskClues {
            myBoardInstance.loadPuzzle(clueButton: j)
        }
    }

    func giveTags() {
        for i in gridButtonsOutlets { //jedes Element in den gridButtons
            i.setTitle("", for: .normal)
            i.tag = counter //erhält einen Tag, beginnend mit 11 (=counter)
            counter += 1 //der erste gridButton hat tag=11, nun wird counter
            if counter % 10 > 4 { //erhöht; falls "Einerziffer" größer als 4
                counter += 6 //erhöhen wir um 6, damit Zehnerziffer +1 steigt
            }   //Bsp.: 11->12->13->14->statt 15 -> +6 = 21 usw.
        }  //Sinn der Sache: die tags entsprechen der Zeilen-/Spaltennummerierung,
        makeRowsCols()  //ohne die übliche Index = 0 beginnend
    }                   //dann nächste Fkt. aufrufen
    
    //Der 2-dimensionale Array rows enthält 4 Arrays, die die Zeilen repräsentieren, und jeder dieser Arrays beinhaltet als Elemente vier UIButtons
    func makeRowsCols() {
        myBoardInstance.rows.removeAll()
        var zaehler = -4
        for _ in 1...4 {
            var cols = [UIButton]()
            zaehler += 4
            for i in 0...3 {
                cols.append(gridButtonsOutlets[i + zaehler])
            }
            myBoardInstance.rows.append(cols)
        }
    }
    
    @IBAction func gridButtons(_ sender: UIButton) {
        if sender.tag < 500 {
            myBoardInstance.highlightYellow(sender: sender)
        }
        
    }
    
    @IBAction func letterButtons(_ sender: UIButton) {
        myBoardInstance.userInputs(sender: sender)
    }
}
