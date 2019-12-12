//
//  ViewController.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import FacebookCore// Facebook Podfile
import FacebookLogin// Facebook Podfile
import GoogleSignIn// Google Podfile

// Main ViewController
class ViewController: UIViewController, LoginButtonDelegate {
    // UIButton for setting the language to finnish
    @IBOutlet weak var finButton: UIButton!
    // UIButton for setting the language to english
    @IBOutlet weak var ukButton: UIButton!
    // Instructs the user to choose language
    @IBOutlet weak var languageInstructionLabel: UILabel!
    // UIButton to continue without Google or Facebook login
    @IBOutlet weak var continueButton: UIButton!
    // Displayes the 'MeeKouluun' logo
    @IBOutlet weak var logoImageView: UIImageView!
    // UIButton to continue with Google account
    @IBOutlet weak var googleSignInButton: UIButton!
    // FBLoginButton to continue with Facebook account
    @IBOutlet weak var facebookSignInButton: FBLoginButton!
    // Not in use, native APIbutton to sign in with google.
    @IBOutlet weak var googleButton: GIDSignInButton!
    // Creates a layer that draws a color gradient over its background color
    let layer = CAGradientLayer()

    // Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hides Googles native Button. Replaced by UIButton.
        googleButton.isHidden = true
        // Fetches the 'MeeKouluun' logo for ImageView
        logoImageView.image = UIImage(named: ("logo"))
        // Changest the language of the languageInstructionLabel text
        languageInstructionLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "language_instruction_text", comment: "")
        languageInstructionLabel.textColor = .white
        languageInstructionLabel.font = UIFont.systemFont(ofSize: 20)
        // Changest the language of the continueButton text
        continueButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continue_text", comment: ""), for: .normal)
        // If showsTouchWhenHighlighted = true. Gives the button a glow when clicked.
        ukButton?.showsTouchWhenHighlighted = true
        finButton?.showsTouchWhenHighlighted = true
        // Checks current language setting and highlights the active language selection button
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            finButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            ukButton?.backgroundColor = UIColor(red: 0.72, green: 0.76, blue: 0.78, alpha: 1)
        } else if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            ukButton?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            finButton?.backgroundColor = UIColor(red: 0.72, green: 0.76, blue: 0.78, alpha: 1)
        }
        // Setting bounds and color for gradient layer
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        // Inserts gradient layer to the background
        view.layer.insertSublayer(layer, at: 0)
        view.addSubview(facebookSignInButton)
        view.addSubview(googleSignInButton)
        facebookSignInButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "facebook_text", comment: ""), for: .normal)
        googleSignInButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "google_text", comment: ""), for: .normal)
        // Makes the sign in browser to pop up in this ViewController
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Hides the NavigationBar
        self.navigationController?.isNavigationBarHidden = true
        // Button styling setup
        setup()
        // Not in use:
        // Automatically sign in the user.
        // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    // Button styling
    func setup() {
        // For facebookSignInButton
        facebookSignInButton.layer.cornerRadius = 20
        facebookSignInButton.backgroundColor = UIColor(red: 0.23, green: 0.35, blue: 0.60, alpha: 1)
        facebookSignInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        facebookSignInButton.setTitleColor(.white, for: .normal)
        facebookSignInButton.layer.cornerRadius = 20
        facebookSignInButton.layer.borderWidth = 1
        facebookSignInButton.layer.borderColor = UIColor.black.cgColor
        facebookSignInButton.translatesAutoresizingMaskIntoConstraints = false
        // For googleSignInButton
        googleSignInButton.backgroundColor = .white
        googleSignInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        googleSignInButton.setTitleColor(.darkGray, for: .normal)
        googleSignInButton.layer.cornerRadius = 20
        googleSignInButton.layer.borderWidth = 1
        googleSignInButton.layer.borderColor = UIColor.black.cgColor
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        // For continueButton
        continueButton.backgroundColor = UIColor(red: 0.77, green: 0.12, blue: 0.36, alpha: 1)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 20
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.black.cgColor
        // For finButton
        finButton.layer.cornerRadius = 25
        // For ukButton
        ukButton.layer.cornerRadius = 25
    }
    
    // Functions to sign in with Google account
    @IBAction func googleButtonAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    // Changes the language settings to english
    @IBAction func changeLanguageToEN(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        }
        // Refreshes the view
        viewDidLoad()
    }
    
    // Changes the language settings to finnish
    @IBAction func changeLanguageToFI(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "fi")
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "fi")
        }
        // Refreshes the view
        viewDidLoad()
    }
    
    // Function to sign in with Facebook
    @IBAction private func loginWithReadPermissions() {
        let loginManager = LoginManager()
        loginManager.logIn(
            permissions: [.publicProfile, .userFriends],
            viewController: self
        ) { result in
            self.loginManagerDidComplete(result)
            self.fetchUserProfile()
        }
    }
    
    // Function to log out of Facebook
    @IBAction private func logOut() {
        print("--------Logout----------------------")
        let loginManager = LoginManager()
        loginManager.logOut()
        
        print("logout ---------")
    }
    
    // Not in use, signs out from Google, done in AppDelegate
    @IBAction func didTapSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Google Sign out")
    }
    
    // Sent to the delegate when the FBLoginButton was used to login.
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Did complete login via LoginButton with result \(String(describing: result)) " +
            "error\(String(describing: error))")
        // Calls function to get user info
        self.fetchUserProfile()
    }
    
    // Sent to the delegate when the FBLoginButton was used to logout.
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logout func")
    }
    
    // Function to comfirm login
    func loginManagerDidComplete(_ result: LoginResult) {
        print("\n\n result: \(result)")
        switch result {
        case .cancelled: print("cancelled")
        case .failed: print("failed")
        case .success(let grantedPermissions, _, _):
            print("Login succeeded with granted permissions: \(grantedPermissions)")
        }
    }
    
    // Fetches the Facebook user info
    func fetchUserProfile()
    {// Requests specific parameter from Facebook
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, hometown"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: HTTPMethod.get)
        // Starts a connection to the Graph API.
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
                    let name = info["name"] as! String
                    print("------------------------------")
                    print(name)
                }
                if info["email"] as? String != nil {
                    let email = info["email"] as! String
                    print("------------------------------")
                    print(email)
                    // Sets Person class an email
                    personInstance.setEmail(email)
                    // Disables Googles sign in button
                    self.googleButton.isEnabled = false
                    self.continueButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "signed_in", comment: ""), for: .normal)
                    // If email is succesfully set to Person class, user is logged out from Facebook
                    if personInstance.email.count > 5 {
                        let loginManager = LoginManager()
                        loginManager.logOut()
                        // Segues the user to basic questions
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BasicQuestions1Age") as? BasicQuestions1
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                }
                if info["hometown"] as? String != nil {
                    let hometown = info["hometown"] as! String
                    print("------------------------------")
                    print(hometown)
                }
            }
        })
    }
}
