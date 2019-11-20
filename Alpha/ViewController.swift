//
//  ViewController.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let layer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layer.frame = view.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    @IBAction func SignInWithGoogle(_ sender: UIButton!){
        TransitionSignedIn(sender.self)
        print("Google signin")
    }
    
    @IBAction func SignInWithFaceBook(_ sender: UIButton!) {
        TransitionSignedIn(sender.self)
        print("Facebook signin")
        
    }
    
    @IBAction func ContinueWithoutSigning(_ sender: UIButton!) {
        Transition(sender.self)
        print("Continue without signing")

    }
    
    private func Transition(_ sender: UIButton!) {
        performSegue(withIdentifier: "signIn", sender: self)
    }

    private func TransitionSignedIn(_ sender: UIButton!) {
        performSegue(withIdentifier: "signedIn", sender: self)
    }
}

