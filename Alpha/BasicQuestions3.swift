//
//  BasicQuestions3.swift
//  Alpha
//
//  Created by iosdev on 20/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import CoreData

class BasicQuestions3: UIViewController {
    //
    @IBOutlet weak var elementaryButton: UIButton!
    @IBOutlet weak var tradeSchoolButton: UIButton!
    @IBOutlet weak var highSchoolButton: UIButton!
    @IBOutlet weak var collegeButton: UIButton!
    @IBOutlet weak var universityButton: UIButton!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationContinueButton: UIButton!
    var storedEducation = Int()

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
            storedEducation = selectedEducation
        }
    }
    let layer = CAGradientLayer()
    
    
    @IBAction func saveData(_ sender: Any) {
        DeleteAllData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity1", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(storedEducation, forKey: "education")
        
        do {
            try context.save()
            print("Saved to core data")
        } catch {
            print("Failed saving")
            
        }
    }
    func checkCoreData(){
        print("checkCoreData()")
        let education = storedEducation
        print("education \(education)")
        elementaryButton.backgroundColor = .white
        tradeSchoolButton.backgroundColor = .white
        highSchoolButton.backgroundColor = .white
        collegeButton.backgroundColor = .white
        universityButton.backgroundColor = .white
 
        switch education{
        case 1:
            elementaryButton.backgroundColor = .lightGray
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
        case 2:
            tradeSchoolButton.backgroundColor = .lightGray
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
        case 3:
            highSchoolButton.backgroundColor = .lightGray
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
        case 4:
            collegeButton.backgroundColor = .lightGray
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
        case 5:
            universityButton.backgroundColor = .lightGray
            educationContinueButton.isUserInteractionEnabled = true
            educationContinueButton.alpha = 1
        default:
            print("No core default")
        }
        
    }
    func getData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity1")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                storedEducation = data.value(forKey: "education") as! Int
                print("GetData() \nEducation = \(storedEducation)")
                
            }
        } catch {
            print("getData failed")
        }
        
    }
    func DeleteAllData(){
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Entity1"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        setup()
        
        educationLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "education_label", comment: "")
        educationLabel.textColor = .white
        educationLabel.font = UIFont.systemFont(ofSize: 20)

        elementaryButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "elementary", comment: ""), for: .normal)
        tradeSchoolButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "trade_school", comment: ""), for: .normal)
        highSchoolButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "high_school", comment: ""), for: .normal)
        collegeButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "college", comment: ""), for: .normal)
        universityButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "university", comment: ""), for: .normal)
        educationContinueButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "education_continue_button", comment: ""), for: .normal)
        educationContinueButton.isUserInteractionEnabled = false
        educationContinueButton.alpha = 0.1
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        checkCoreData()
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
        educationContinueButton.backgroundColor = UIColor(red: 0.77, green: 0.12, blue: 0.36, alpha: 1)
        
        elementaryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        tradeSchoolButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        highSchoolButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        collegeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        universityButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        educationContinueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        elementaryButton.setTitleColor(.darkGray, for: .normal)
        tradeSchoolButton.setTitleColor(.darkGray, for: .normal)
        highSchoolButton.setTitleColor(.darkGray, for: .normal)
        collegeButton.setTitleColor(.darkGray, for: .normal)
        universityButton.setTitleColor(.darkGray, for: .normal)
        educationContinueButton.setTitleColor(.white, for: .normal)
        
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
