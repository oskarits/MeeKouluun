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
    var email: String?
    var unwrapped: String = ""
    
    //let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        //emailInput.delegate = self
        sendButton.isUserInteractionEnabled = false
        sendButton.alpha = 0.5
        sendButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "send_email", comment: ""), for: .normal)
        emailLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_label", comment: "")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func fetch(){
        let urlRequest = URLRequest(url: URL(string: "http://users.metropolia.fi/~tuomamp/testDb.json")!)
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
                        if let organisation = resultFromJson["organisation"] as? String, let faculty = resultFromJson["faculty"] as? String, let location = resultFromJson["location"] as? String, let language = resultFromJson["language"] as? String, let amkUni = resultFromJson["amkUni"] as? String, let duration = resultFromJson["duration"] as? String, let url = resultFromJson["url"] as? String, let about = resultFromJson["description"] as? String
                        {
                            result.organisation = organisation
                            result.faculty = faculty
                            result.location = location
                            result.language = language
                            result.amkUni = amkUni
                            result.duration = duration
                            result.url = url
                            result.about = about
                        }
                        self.results.append(result)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as! ResultsCell
        
        //Bind to cell outlets here like above.
        cell.organisation.text = self.results[indexPath.item].organisation
        cell.faculty.text = self.results[indexPath.item].faculty
        cell.location.text = self.results[indexPath.item].location
        cell.language.text = self.results[indexPath.item].language
        cell.amkUni.text = self.results[indexPath.item].amkUni
        //cell.description.text = self.results[indexPath.item].description
        cell.duration.text = self.results[indexPath.item].duration
        //   cell.url.text = self.results[indexPath.item].url
        
        return cell
    }
    
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
    
    func openSend(_ userEmail: String, _ body: [SingleResult]) {
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
     
    
    
    
    @IBAction func sendEmaill(_ sender: UIButton) {
        print("RESULTS \n \(dump(results))")
        
        let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_alert_text", comment: ""), message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_yes", comment: ""), style: .default, handler: { action in
            self.openSend(self.unwrapped, self.results)
        }))
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "email_no", comment: ""), style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}










