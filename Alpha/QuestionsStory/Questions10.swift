//
//  Questions10.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class Questions10: UIViewController {

    let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.frame = view.bounds
        layer.colors = [UIColor.yellow.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
    }
    @IBAction func QResultsButton(_ sender: UIButton) {
        Transition(sender.self)
        print("To Results Boi")
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
