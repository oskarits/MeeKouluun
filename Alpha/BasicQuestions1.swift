//
//  BasicQuestions1.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class BasicQuestions1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BasicQuestionButton(_ sender: UIButton) {
        Transition(sender.self)
        print("basicQ button 1")
    }
    
    @IBAction func BasicQuestionButton2(_ sender: UIButton!) {
        Transition(sender.self)
        print("basicQ button 2")
        
    }
    private func Transition(_ sender: UIButton!) {
        performSegue(withIdentifier: "segue1", sender: self)
    }
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
