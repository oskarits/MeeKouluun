//
//  StartQuestionsViewController.swift
//  Alpha
//
//  Created by iosdev on 05/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

//Transition screen between Basic questions and the questions
class ExplanationScreen: UIViewController {
    
    //Label for briefing about the questionnaire
    @IBOutlet weak var startQuestionsLabel: UILabel!
    //Button for going to results
    @IBOutlet weak var startQuestionsButton: UIButton!
    @IBOutlet weak var explanationImageView: UIImageView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    let layer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuestionsLabel.font = UIFont (name: "Helvetica Neue", size: 20)
        //Changest the language of the startQuestionsLabel text
        startQuestionsLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "start_questions_text", comment: "")
        startQuestionsLabel.textColor = .white

        instructionLabel.font = UIFont (name: "Helvetica Neue", size: 20)
        instructionLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "instruction_text", comment: "")
        instructionLabel.textColor = .white
        
        //Changest the language of the startQuestionsButton text
        startQuestionsButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "start_questions_button", comment: ""), for: .normal)

        explanationImageView.image = UIImage(named: ("swipe"))
        // Do any additional setup after loading the view.
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        
        startQuestionsButton.layer.cornerRadius = 20
        startQuestionsButton.backgroundColor = UIColor(red: 0.77, green: 0.12, blue: 0.36, alpha: 1)
        startQuestionsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        startQuestionsButton.setTitleColor(.white, for: .normal)
        startQuestionsButton.layer.cornerRadius = 20
        startQuestionsButton.layer.borderWidth = 1
        startQuestionsButton.layer.borderColor = UIColor.black.cgColor
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
