//
//  Questions2.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class Questions2: UIViewController {

    @IBOutlet weak var questions2Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Questions2Button1(_ sender: UIButton) {
        Transition(sender.self)
        print("questions2 button 1")

    }
    @IBAction func Questions2Button2(_ sender: UIButton) {
        Transition(sender.self)
        print("questions2 button 2")
    }
    
    private func Transition(_ sender: UIButton!) {
        performSegue(withIdentifier: "results", sender: self)
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
