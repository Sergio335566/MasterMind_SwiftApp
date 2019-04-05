//
//  homeViewController.swift
//  Mastermind
//
//  Created by Sergiu BOCANCEA on 05/04/2019.
//  Copyright © 2019 Sergiu BOCANCEA. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    @objc func swipe(gesture: UISwipeGestureRecognizer) -> Void{
        if gesture.direction == UISwipeGestureRecognizerDirection.up {
            print("Swipe Up")
            performSegue(withIdentifier: "toGame", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
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
