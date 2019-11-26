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

import FacebookShare
import SDWebImage
import MobileCoreServices
import DropDown

class ViewController: UIViewController, LoginButtonDelegate {
   
    

    let layer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layer.frame = view.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
//        loginButton = FBLoginButton(
//            readPermissions: [ .publicProfile, .email, .userFriends ]
//        )
        
        let loginButton = FBLoginButton(permissions: [ .publicProfile, .email ])
        loginButton.center = view.center
        loginButton.delegate = self

        
        //print(loginButton.permissions)
        
        if let accessToken = AccessToken.current {
            print("--------------------------")
            // User is logged in, use 'accessToken' here.
        }

        view.addSubview(loginButton)
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Did complete login via LoginButton with result \(String(describing: result)) " +
        "error\(String(describing: error))")
       }
       
       func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
           print("Logout func")
       }
    
    
    
    
    
    
    
    
    
    
 
    @IBAction func logintBtnClicked(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    let connection = GraphRequestConnection()
                    
                    
                    print("--------------------------")
                    print("Logged in!")
                    print(loginResult)
                    print(loginResult.self)
                    print("--------------------------")
                    print(FacebookCore.Permission.email)
                    print(FacebookCore.Permission.publicProfile)
                    print("--------------------------")

                }
            }
       
        
        if let accessToken = AccessToken.current {
        // User is logged in, use 'accessToken' here.
            print(accessToken.expirationDate)
            print("----------access----------------")
            
        }
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func loginManagerDidComplete(_ result: LoginResult) {
//        let alertController: UIAlertController
        print("\n\n result: \(result)")
        switch result {
        case .cancelled: print("cancelled")

        case .failed: print("failed")

        case .success(let grantedPermissions, _, _):
            print("Login succeeded with granted permissions: \(grantedPermissions)")
        }
//        self.present(alertController, animated: true, completion: nil)
    }
    
    
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

    @IBAction private func logOut() {
        print("--------Logout----------------------")
        let loginManager = LoginManager()
        loginManager.logOut()

        print("logout ---------")
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
    
    
    func fetchUserProfile()
       {
           //let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name"])
           let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: HTTPMethod.get)

        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
               
               if ((error) != nil)
               {
                   print("Error took place: \(error)")
               }
               else
               {
                   print("Print entire fetched result: \(result)")
             
                
                    
                let info = result as! [String : AnyObject]
                    
                if info["name"] as? String != nil {
                        let xxx = info["name"] as! String
                        print("------------------------------")
                        print(xxx)
                        print("------------------------------")

                    }
                if info["email"] as? String != nil {
                        let xxx = info["email"] as! String
                        print("------------------------------")
                        print(xxx)
                        print("------------------------------")

                    }
                
               }
           })
       }
//    if let result = result as? [String:String],
//    let email: String = result["email"],
//    let fbId: String = result["id"] {
//     print(email)
//     print(fbId)
//     print("^^^^^^^^^^^___________^^^^^^^^^")
//    func fetchUserProfile()
//    {
//        //let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name"])
//        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: HTTPMethod.get)
//
//     graphRequest.start(completionHandler: { (connection, result, error) -> Void in
//
//            if ((error) != nil)
//            {
//                print("Error took place: \(error)")
//            }
//            else
//            {
//                print("Print entire fetched result: \(result)")
//
//            }
//        })
//    }

    
}








