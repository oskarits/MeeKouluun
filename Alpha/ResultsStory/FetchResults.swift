//
//  FetchResults.swift
//  Alpha
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Jari Pietikäinen, Tuomas Paavolainen, Oskari Sieranen, Otto Söderlund. All rights reserved.
//

import UIKit
import MessageUI

class FetchResults: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var results: [SingleResult] = []
    var unwrapped: String = ""
    
    let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        // Deactivate button and localisations
        sendButton.isUserInteractionEnabled = false
        sendButton.alpha = 0.5
        sendButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "send_email", comment: ""), for: .normal)
        emailLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_label", comment: "")
        
        // Check if user has logged in with Google/FB and input email in to textfield and activate button
        if (personInstance.email.count > 1) {
           emailInput.text = personInstance.email
            self.activateSend()
        }
        // Set background color
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    //hide navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    // Fetch data from database and append to results array
    func fetch(){
        let urlRequest = URLRequest(url: URL(string: LocalizationSystem.sharedInstance.localizedStringForKey(key: "database_link", comment: ""))!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            self.results = [SingleResult]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let resultsFromJson = json["results"] as? [[String: AnyObject]] {
                    for resultFromJson in resultsFromJson {
                        let result = SingleResult()
                        if let organisation = resultFromJson["organisation"] as? String, let faculty = resultFromJson["faculty"] as? String, let location = resultFromJson["location"] as? String, let language = resultFromJson["language"] as? String, let amkUni = resultFromJson["amkUni"] as? String, let duration = resultFromJson["duration"] as? String, let url = resultFromJson["url"] as? String, let about = resultFromJson["description"] as? String, let points = resultFromJson["points"] as? Int
                        {
                            result.organisation = organisation
                            result.faculty = faculty
                            result.location = location
                            result.language = language
                            result.amkUni = amkUni
                            result.duration = duration
                            result.url = url
                            result.about = about
                            result.points = points
                            // Results are added and calculated on the fly
                            let magic = result.points?.digits
                            result.score = personInstance.compareScores(comparisonArray: magic ?? [0, 0, 0])
                        }
                        self.results.append(result)
                        // Results are sorted after each addition
                        self.results = self.results.sorted(by: {Int($0.score ?? 0.0) > Int($1.score ?? 0.0)})
                    }
                    
                    print("RESPONSE: \n\(json)")
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    // Create cells with fetched data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as! ResultsCell
        
        //Bind to cell outlets here like above.
        cell.organisation.text = self.results[indexPath.item].organisation
        cell.faculty.text = self.results[indexPath.item].faculty
        cell.location.text = self.results[indexPath.item].location
        cell.language.text = self.results[indexPath.item].language
        cell.amkUni.text = self.results[indexPath.item].amkUni
        cell.duration.text = self.results[indexPath.item].duration
        
        return cell
    }
    
    // Create single view for result
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Results", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultsSingle") as? ResultsViewController
        
        // BIND HERE
        vc?.organisationTitle = self.results[indexPath.item].organisation ?? "fail organisation"
        vc?.facultyTitle = self.results[indexPath.item].faculty ?? "fail faculty"
        vc?.locationTitle = self.results[indexPath.item].location ?? "fail location"
        vc?.languageTitle = self.results[indexPath.item].language ?? "fail language"
        vc?.amkUniTitle = self.results[indexPath.item].amkUni ?? "fail amkUni"
        vc?.descriptionTitle = self.results[indexPath.item].about ?? "fail about"
        vc?.durationTitle = self.results[indexPath.item].duration ?? "fail duration"
        vc?.urlTitle = self.results[indexPath.item].url ?? "fail url"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    //MARK: Email
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    // activate send button
    func activateSend() -> Void {
        self.sendButton.isUserInteractionEnabled = true
        self.sendButton.alpha = 1
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resignFirstResponder()
    }
    
    // Get user inputted email if did not log in and validate
    @IBAction func textFieldEdited(_ sender: UITextField) {
        print("text field edited")
        let userEmail: String? = emailInput.text
        //inputLength = userEmail?.count ?? nil
        unwrapped = userEmail ?? "foo"
        if (unwrapped.contains("@")) {
            self.activateSend()
            print(userEmail ?? "foo")
        }
    }
    
    // Mail Compose delegate setup. Not working with iOS simulator. Best case would be to send email from backend
    func openSend(_ userEmail: String, _ body: [String?]) {
     if MFMailComposeViewController.canSendMail() {
     let mail = MFMailComposeViewController()
     mail.mailComposeDelegate = self
     mail.setToRecipients([userEmail])
     mail.setMessageBody("\(body)", isHTML: true)
     present(mail, animated: true)
        print("sent")
     } else {
        print("Cannot send email because of iOS Simulator")
     }
        
     }
     
    // Create alert to check if user wants to send the results as email and then print results to console because Mail Compose not working with iOS simulator.
    @IBAction func sendEmaill(_ sender: UIButton) {
        
        let schools = self.results.map({ (organisation) -> String? in
            return organisation.faculty
        })
        
        print("RESULTS \n \(schools)")
        
        let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_alert_text", comment: ""), message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_yes", comment: ""), style: .default, handler: { action in
            self.openSend(self.unwrapped, schools)
        }))
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_no", comment: ""), style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}

extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}





