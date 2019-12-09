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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Changest the language of the startQuestionsLabel text
        startQuestionsLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "start_questions_text", comment: "")
        //Changest the language of the startQuestionsButton text
        startQuestionsButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "start_questions_button", comment: ""), for: .normal)
        // Do any additional setup after loading the view.
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
