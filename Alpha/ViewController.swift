//
//  ViewController.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import FacebookShare

class ViewController: UIViewController, LoginButtonDelegate {
    @IBOutlet weak var finButton: UIButton!
    @IBOutlet weak var ukButton: UIButton!
    @IBOutlet weak var languageInstructionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var googleButton: GIDSignInButton!
    @IBOutlet weak var continueButton: UIButton!
    
    let layer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        languageLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "language_header_text", comment: "")
        languageInstructionLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "language_instruction_text", comment: "")
        continueButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continue_text", comment: ""), for: .normal)
        ukButton?.showsTouchWhenHighlighted = true
        finButton?.showsTouchWhenHighlighted = true
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            finButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            ukButton?.backgroundColor = UIColor(red: 0.72, green: 0.76, blue: 0.78, alpha: 1)
        } else if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            ukButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            finButton?.backgroundColor = UIColor(red: 0.72, green: 0.76, blue: 0.78, alpha: 1)
        }
        layer.frame = view.bounds
        layer.colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        layer.frame = view.bounds
        layer.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:0.5, y:0.5)
        view.layer.insertSublayer(layer, at: 1)
        let loginButton = FBLoginButton(permissions: [ .publicProfile, .email ]) // .userHometown
        loginButton.delegate = self
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 40, y: 400, width: 250, height: 40)
        loginButton.center = view.center
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func changeLanguageToEN(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        }
        viewDidLoad()
    }
    @IBAction func changeLanguageToFI(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "fi")
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "fi")
        }
        viewDidLoad()
    }

    //not in use, signs out from Google
    @IBAction func didTapSignOut(_ sender: UIButton) {
      GIDSignIn.sharedInstance().signOut()
    print("Google Sign out")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Did complete login via LoginButton with result \(String(describing: result)) " +
        "error\(String(describing: error))")
        self.fetchUserProfile()
       }
       
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
           print("Logout func")
       }
    
    func fetchUserProfile()
       {
           let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, hometown"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: HTTPMethod.get)

        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
               if ((error) != nil)
               {
                print("Error took place: \(String(describing: error))")
               }
               else
               {
                print("Entire fetched result: \(String(describing: result))")
                let info = result as! [String : AnyObject]
                print(info)
                if info["name"] as? String != nil {
                        let xxx = info["name"] as! String
                        print("------------------------------")
                        print(xxx)
                }
                if info["email"] as? String != nil {
                        let xxx = info["email"] as! String
                        print("------------------------------")
                        print(xxx)
                }
                if info["hometown"] as? String != nil {
                        let xxx = info["hometown"] as! String
                        print("------------------------------")
                        print(xxx)
                }
            }
        })
       }
    //not in use
    // Used by loginWithReadPermissions()
    func loginManagerDidComplete(_ result: LoginResult) {
        print("\n\n result: \(result)")
        switch result {
        case .cancelled: print("cancelled")
        case .failed: print("failed")
        case .success(let grantedPermissions, _, _):
            print("Login succeeded with granted permissions: \(grantedPermissions)")
        }
    }
    
    //not in use
    @IBAction private func loginWithReadPermissions() {
        print("------------Login------------------")
        let loginManager = LoginManager()
        loginManager.logIn(
            permissions: [.publicProfile, .userFriends],
            viewController: self
        ) { result in
            self.loginManagerDidComplete(result)
            print("Results: ----")
            print(result)
            self.fetchUserProfile()
        }
    }

    //not in use
    @IBAction private func logOut() {
        print("--------Logout----------------------")
        let loginManager = LoginManager()
        loginManager.logOut()

        print("logout ---------")
    }
}
