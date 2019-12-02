//
//  Questions1.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class Questions1: UIViewController {

    let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.frame = view.bounds
        layer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    @IBAction func BasicQuestionButton2(_ sender: UIButton!) {
        print("Questions 1 button")
        print("------------------")

    }

}
