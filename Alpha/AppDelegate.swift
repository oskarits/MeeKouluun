//
//  AppDelegate.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import CoreData
import FacebookCore//Facebook Podfile
import FacebookLogin//Facebook Podfile
import GoogleSignIn//Google Podfile

@UIApplicationMain
//A set of methods that are called by the singleton UIApplication object in response to important events in the lifetime of your app.
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    //The backdrop for app’s user interface and the object that dispatches events to views.
    var window: UIWindow?
    
    //Asks the delegate for the interface orientations to use for the view controllers.
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    //Tells the delegate that the launch process is almost done and the app is almost ready to run.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().clipsToBounds = false
        //Wrapper for FBSDKCoreKit
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        //The client ID of the app from the Google APIs console. Must set for sign-in to work.
        GIDSignIn.sharedInstance()?.clientID = "324717223565-j36smevb65kegmf4mi7dokupu9a441b6.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        return true
    }
    
    //Asks the delegate to open a resource specified by a URL
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //Returns either Facebook or Google URL
        return ApplicationDelegate.shared.application(app, open: url, options: options) || GIDSignIn.sharedInstance().handle(url)
    }
    
    //This class signs the user in with Google.
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            //Information about an error condition including a domain, a domain-specific error code, and application-specific information.
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                //Indicates there are no valid auth tokens in the keychain
                print("The user has not signed in before or they have since signed out.")
            } else {
                //Retrieve the localized description for this error.
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        /* Not currently in use for the app:
         let userId = user.userID                   // For client-side use only!
         let idToken = user.authentication.idToken // Safe to send to the server
         let givenName = user.profile.givenName
         let familyName = user.profile.familyName
         */
        
        //The Google user's full name.
        let fullName = user.profile.name
        //The Google user's email.
        let email = user.profile.email

        //Checks if Person class already has an email set
        if personInstance.email.count > 1 {
            print("no email required")
        } else if personInstance.email.count <= 1{
            if let printFullName = fullName {
                print(printFullName)
            }
            if let printEmail = email {
                //Sets Person class an email
                personInstance.setEmail(printEmail)
                print(printEmail)
                //Marks current user as being in the signed out state.
                GIDSignIn.sharedInstance().signOut()
                //The root view controller for the window.
                let rootViewController = self.window!.rootViewController as!
                UINavigationController
                //Sets Interface Builder storyboard resource file.
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                //Instantiates and returns the view controller with the specified identifier.
                let BasicQuestions1 = mainStoryboard.instantiateViewController(withIdentifier: "BasicQuestions1Age") as! BasicQuestions1
                //Pushes a view controller onto the receiver’s stack and updates the display.
                rootViewController.pushViewController(BasicQuestions1, animated: true)
            }
        }
    }
    //Actions after Google user is signed out
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        print("Google disconnected.")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        AppEvents.activateApp()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Alpha")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
