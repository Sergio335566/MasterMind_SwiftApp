//
//  winViewController.swift
//  Mastermind
//
//  Created by Sergiu BOCANCEA on 05/04/2019.
//  Copyright © 2019 Sergiu BOCANCEA. All rights reserved.
//

import UIKit

class winViewController: UIViewController {

    @IBOutlet weak var solution0: UILabel!
    @IBOutlet weak var solution1: UILabel!
    @IBOutlet weak var solution2: UILabel!
    @IBOutlet weak var solution3: UILabel!
    
    @IBAction func restartGame(_ sender: Any) {
        performSegue(withIdentifier: "restartGame", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        solution0.text = solution[0]
        solution1.text = solution[1]
        solution2.text = solution[2]
        solution3.text = solution[3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
