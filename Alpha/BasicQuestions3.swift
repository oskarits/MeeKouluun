//
//  BasicQuestions3.swift
//  Alpha
//
//  Created by iosdev on 20/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class BasicQuestions3: UIViewController {
    //
    @IBOutlet weak var elementaryButton: UIButton!
    @IBOutlet weak var tradeSchoolButton: UIButton!
    @IBOutlet weak var highSchoolButton: UIButton!
    @IBOutlet weak var collegeButton: UIButton!
    @IBOutlet weak var universityButton: UIButton!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationContinueButton: UIButton!
    
    @IBAction func Elementary(_ sender: UIButton!) {
        EducationSelected(sender)

    }
    @IBAction func TradeSchool(_ sender: UIButton!) {
        EducationSelected(sender)

    }
    @IBAction func HighSchool(_ sender: UIButton!) {
        EducationSelected(sender)

    }
    @IBAction func College(_ sender: UIButton!) {
        EducationSelected(sender)

    }
    @IBAction func University(_ sender: UIButton!) {
        EducationSelected(sender)
    }
    
    var selectedEducation = 0
    
    func EducationSelected(_ sender: UIButton) {
        print("sender tag: \(sender.tag)")
        selectedEducation = sender.tag
        sender.showsTouchWhenHighlighted = true
        elementaryButton.backgroundColor = .white
        tradeSchoolButton.backgroundColor = .white
        highSchoolButton.backgroundColor = .white
        collegeButton.backgroundColor = .white
        universityButton.backgroundColor = .white
        sender.backgroundColor = .lightGray
        if(selectedEducation != 0) {
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
            print("selectedEducation: \(selectedEducation)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        educationLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "education_label", comment: "")
        elementaryButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "elementary", comment: ""), for: .normal)
        tradeSchoolButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "trade_school", comment: ""), for: .normal)
        highSchoolButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "high_school", comment: ""), for: .normal)
        collegeButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "college", comment: ""), for: .normal)
        universityButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "university", comment: ""), for: .normal)
        educationContinueButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "education_continue_button", comment: ""), for: .normal)
        educationContinueButton.isUserInteractionEnabled = false
        educationContinueButton.alpha = 0.1
        setup()
    }
    
    func setup() {
        elementaryButton.translatesAutoresizingMaskIntoConstraints = false
        tradeSchoolButton.translatesAutoresizingMaskIntoConstraints = false
        highSchoolButton.translatesAutoresizingMaskIntoConstraints = false
        collegeButton.translatesAutoresizingMaskIntoConstraints = false
        universityButton.translatesAutoresizingMaskIntoConstraints = false
        educationContinueButton.translatesAutoresizingMaskIntoConstraints = false
        
        elementaryButton.backgroundColor = .white
        tradeSchoolButton.backgroundColor = .white
        highSchoolButton.backgroundColor = .white
        collegeButton.backgroundColor = .white
        universityButton.backgroundColor = .white
        educationContinueButton.backgroundColor = .white
        
        elementaryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        tradeSchoolButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        highSchoolButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        collegeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        universityButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        educationContinueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        elementaryButton.setTitleColor(.blue, for: .normal)
        tradeSchoolButton.setTitleColor(.blue, for: .normal)
        highSchoolButton.setTitleColor(.blue, for: .normal)
        collegeButton.setTitleColor(.blue, for: .normal)
        universityButton.setTitleColor(.blue, for: .normal)
        educationContinueButton.setTitleColor(.blue, for: .normal)
        
        elementaryButton.layer.cornerRadius = 20
        tradeSchoolButton.layer.cornerRadius = 20
        highSchoolButton.layer.cornerRadius = 20
        collegeButton.layer.cornerRadius = 20
        universityButton.layer.cornerRadius = 20
        educationContinueButton.layer.cornerRadius = 20
        
        elementaryButton.layer.borderWidth = 1
        tradeSchoolButton.layer.borderWidth = 1
        highSchoolButton.layer.borderWidth = 1
        collegeButton.layer.borderWidth = 1
        universityButton.layer.borderWidth = 1
        educationContinueButton.layer.borderWidth = 1

        elementaryButton.layer.borderColor = UIColor.black.cgColor
        tradeSchoolButton.layer.borderColor = UIColor.black.cgColor
        highSchoolButton.layer.borderColor = UIColor.black.cgColor
        collegeButton.layer.borderColor = UIColor.black.cgColor
        universityButton.layer.borderColor = UIColor.black.cgColor
        educationContinueButton.layer.borderColor = UIColor.black.cgColor
        
        elementaryButton.tag = 1
        tradeSchoolButton.tag = 2
        highSchoolButton.tag = 3
        collegeButton.tag = 4
        universityButton.tag = 5
        educationContinueButton.tag = 6
    }
}
