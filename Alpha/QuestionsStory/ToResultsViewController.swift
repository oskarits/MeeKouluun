//
//  ToResultsViewController.swift
//  Alpha
//
//  Created by iosdev on 05/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class ToResultsViewController: UIViewController {

    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var ResultExplanation: UILabel!
    @IBOutlet weak var ResultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        ResultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "result_explanation_text", comment: "")
        ResultButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to_results_next", comment: ""), for: .normal)
    }
    
    @IBAction func GoToResults(_ sender: UIButton!) {
        ResultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "calculating_results", comment: "")
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 2.1, y: 2.1)
        activityIndicator.transform = transform
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            // do stuff x seconds later
            self.Transition(sender)
        }
    }
    private func Transition(_ sender: UIButton!) {
        ResultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "results_ready", comment: "")
        self.activityIndicator.stopAnimating()
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
