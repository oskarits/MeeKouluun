//
//  ToResultsViewController.swift
//  Alpha
//
//  Created by iosdev on 05/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

// Transition screen between questions and the results
class ToResultsViewController: UIViewController {
    
    // A loading view that shows that a task is in progress.
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    // Label for briefing about the results
    @IBOutlet weak var resultExplanation: UILabel!
    // Button for going to results
    @IBOutlet weak var resultButton: UIButton!
    // Creates a gradient layer
    let layer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Changest the language of the resultExplanation text
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "result_explanation_text", comment: "")
        // Changest the language of the resultButton text
        resultButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to_results_next", comment: ""), for: .normal)
        resultExplanation.font = UIFont.systemFont(ofSize: 20)
        resultExplanation.textColor = .white
        resultButton.layer.cornerRadius = 20
        resultButton.backgroundColor = UIColor(red: 0.77, green: 0.12, blue: 0.36, alpha: 1)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.layer.cornerRadius = 20
        resultButton.layer.borderWidth = 1
        resultButton.layer.borderColor = UIColor.black.cgColor
        // Setting bounds and color for gradient layer
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        // Inserts gradient layer to the background
        view.layer.insertSublayer(layer, at: 0)
    }
    
    // Performs a segue to results
    @IBAction func GoToResults(_ sender: UIButton!) {
        // Changest the text of the resultExplanation to indicate calculation
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "calculating_results", comment: "")
        // Displays an activityIndicator
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .white
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        // Scales the activityIndicator to be larger
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 2.1, y: 2.1)
        activityIndicator.transform = transform
        view.addSubview(activityIndicator)
        // Begins activityIndicator spinning animation
        activityIndicator.startAnimating()
        // Gives 4 seconds of buffering time
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.Transition(sender)
        }
    }
    
    // Performs a segue to results
    private func Transition(_ sender: UIButton!) {
        // Changest the text of the resultExplanation to indicate calculation is done
        resultExplanation?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "results_ready", comment: "")
        // Stops activityIndicator animation
        self.activityIndicator.stopAnimating()
        // Performs the segue to results
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
