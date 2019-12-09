//
//  ToResultsViewController.swift
//  Alpha
//
//  Created by iosdev on 05/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

//Transition screen between questions and the results
class ToResultsViewController: UIViewController {
    
    //A loading view that shows that a task is in progress.
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    //Label for briefing about the results
    @IBOutlet weak var resultExplanation: UILabel!
    //Button for going to results
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changest the language of the resultExplanation text
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "result_explanation_text", comment: "")
        //Changest the language of the resultButton text
        resultButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to_results_next", comment: ""), for: .normal)
    }
    
    //Performs a segue to results
    @IBAction func GoToResults(_ sender: UIButton!) {
        //Changest the text of the resultExplanation to indicate calculation
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "calculating_results", comment: "")
        //Displays an activityIndicator
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        //Scales the activityIndicator to be larger
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 2.1, y: 2.1)
        activityIndicator.transform = transform
        view.addSubview(activityIndicator)
        //Begins activityIndicator spinning animation
        activityIndicator.startAnimating()
        //Gives 4 seconds of buffering time
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.Transition(sender)
        }
    }
    
    //Performs a segue to results
    private func Transition(_ sender: UIButton!) {
        //Changest the text of the resultExplanation to indicate calculation is done
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "results_ready", comment: "")
        //Stops activityIndicator animation
        self.activityIndicator.stopAnimating()
        //Performs the segue to results
        self.performSegue(withIdentifier: "GoToResults", sender: self)
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
