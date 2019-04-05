//
//  ViewController.swift
//  Mastermind
//
//  Created by Sergiu BOCANCEA on 02/04/2019.
//  Copyright © 2019 Sergiu BOCANCEA. All rights reserved.
//

import UIKit
import AudioToolbox

//calcul de notre solution
var random1 = String(Int(arc4random_uniform(9))+1)
var random2 = String(Int(arc4random_uniform(9))+1)
var random3 = String(Int(arc4random_uniform(9))+1)
var random4 = String(Int(arc4random_uniform(9))+1)

var code1 = random1
var code2 = random2
var code3 = random3
var code4 = random4

var test =  ["–", "–", "–", "–"]
var Games = 10
var currentValue = 0
var currentCell = 0

var solution = [code1, code2, code3, code4]

class ViewController: UIViewController {

    @IBOutlet weak var lblBP: UILabel!
    @IBOutlet weak var lblMP: UILabel!
    @IBOutlet weak var lblGames: UILabel!
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var lbl1: UIButton!
    @IBOutlet weak var lbl2: UIButton!
    @IBOutlet weak var lbl3: UIButton!
    @IBOutlet weak var lbl4: UIButton!
    @IBOutlet weak var lbl5: UIButton!
    @IBOutlet weak var lbl6: UIButton!
    @IBOutlet weak var lbl7: UIButton!
    @IBOutlet weak var lbl8: UIButton!
    @IBOutlet weak var lbl9: UIButton!
    @IBOutlet weak var btnValidate: UIButton!
    
    @IBOutlet weak var rank1: UILabel!
    @IBOutlet weak var rank2: UILabel!
    @IBOutlet weak var rank3: UILabel!
    @IBOutlet weak var rank4: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        btnValidate.isEnabled = false
        
        //button1
        lbl1.layer.cornerRadius = 5
        lbl1.addTarget(self, action: #selector(setOne), for: .touchUpInside)
        
        //button2
        lbl2.layer.cornerRadius = 5
        lbl2.addTarget(self, action: #selector(setTwo), for: .touchUpInside)
        
        //button3
        lbl3.layer.cornerRadius = 5
        lbl3.addTarget(self, action: #selector(setThree), for: .touchUpInside)
        
        //button4
        lbl4.layer.cornerRadius = 5
        lbl4.addTarget(self, action: #selector(setFour), for: .touchUpInside)
        
        //button5
        lbl5.layer.cornerRadius = 5
        lbl5.addTarget(self, action: #selector(setFive), for: .touchUpInside)
        
        //button6
        lbl6.layer.cornerRadius = 5
        lbl6.addTarget(self, action: #selector(setSix), for: .touchUpInside)
        
        //button7
        lbl7.layer.cornerRadius = 5
        lbl7.addTarget(self, action: #selector(setSeven), for: .touchUpInside)
    
        //button8
        lbl8.layer.cornerRadius = 5
        lbl8.addTarget(self, action: #selector(setEight), for: .touchUpInside)
        
        //button9
        lbl9.layer.cornerRadius = 5
        lbl9.addTarget(self, action: #selector(setNine), for: .touchUpInside)
    }
    
    
    func resetGame(){
        random1 = String(Int(arc4random_uniform(9))+1)
        random2 = String(Int(arc4random_uniform(9))+1)
        random3 = String(Int(arc4random_uniform(9))+1)
        random4 = String(Int(arc4random_uniform(9))+1)
        code1 = random1
        code2 = random2
        code3 = random3
        code4 = random4
        test =  ["–", "–", "–", "–"]
        Games = 10
        currentValue = 0
        currentCell = 0
        
        solution = [code1, code2, code3, code4]
    }
    
    func vibration(){
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        print("ça vibre")
    }
    
    @IBAction func deleteLine(_ sender: Any) {
        
        if test[3] == "–"{
            if test[2] == "–"{
                if test[1] == "–"{
                    if test[0] == "–"{
                        print("error")
                    }else{
                        test[0] = "–"
                        rank1.text = "–"
                    }
                }else{
                    test[1] = "–"
                    rank2.text = "–"
                }
            }else{
                test[2] = "–"
                rank3.text = "–"
            }
        }else{
            test[3] = "–"
            rank4.text = "–"
        }
    }
    
    @IBAction func validate(_ sender: Any) {
        var BP = 0
        var MP = 0
        
        Games -= 1
        if Games == 0  {
            lose()
        }else  {
            //si gagné
            if test == solution{
                win()

            }else{
                vibration()
                for i in 0..<solution.count{
                    //si bien placé
                    if test[i] == solution[i] {
//                    print("la case", i, "est bien placée")
                        solution[i] = "bp"
                        BP += 1
                    }
                }
                
                for i in 0..<solution.count{
                    if solution.contains(test[i]){
                        if  solution[i] != "bp" {
//                        print("la case", i, "est mal placée")
                            solution[solution.index(of: test[i])!] = "mp"
                            MP += 1
                        }
                    }else {
//                    print("la case", i, "est inexistante")
                    }
                }
            }
            
            lblBP.text = String(BP)
            lblMP.text = String(MP)
            lblTest.text = test.joined(separator: " ")
            lblGames.text = String(Games)
            rank1.text = "–"
            rank2.text = "–"
            rank3.text = "–"
            rank4.text = "–"
            test = ["–", "–", "–", "–"]
            solution = [code1, code2, code3, code4]
            btnValidate.isEnabled = false
        }
       
    }
    
    func lose() {
        self.performSegue(withIdentifier: "toEndGame", sender: self)
    }
    
    func win() {
        self.performSegue(withIdentifier: "toWin", sender: self)
    }
    

    @objc func setOne(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl1.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl1.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl1.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl1.titleLabel!.text!
            rank1.text = test[0]
        }
    }

    @objc func setTwo(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl2.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl2.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl2.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl2.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setThree(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl3.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl3.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl3.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl3.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setFour(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl4.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl4.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl4.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl4.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setFive(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl5.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl5.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl5.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl5.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setSix(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl6.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl6.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl6.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl6.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setSeven(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl7.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl7.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl7.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl7.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setEight(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl8.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl8.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl8.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl8.titleLabel!.text!
            rank1.text = test[0]
        }

    }

    @objc func setNine(sender: UIButton!) {
        if test[0] != "–"{
            if test[1] != "–"{
                if test[2] != "–"{
                    if test[3] != "–"{
                        print("error")
                    }else{
                        test[3] = lbl9.titleLabel!.text!
                        rank4.text = test[3]
                        btnValidate.isEnabled = true
                    }
                }else{
                    test[2] = lbl9.titleLabel!.text!
                    rank3.text = test[2]
                }
            }else{
                test[1] = lbl9.titleLabel!.text!
                rank2.text = test[1]
            }
        }else{
            test[0] = lbl9.titleLabel!.text!
            rank1.text = test[0]
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

