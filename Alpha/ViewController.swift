//
//  ViewController.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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

