//
//  BasicQuestions1.swift
//  Alpha
//
//  Created by Otto on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import CoreData

// ViewController to ask for user's age
class BasicQuestions1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // PickerView data variable
    var ageData = (15...100).map{ String($0)}
    var storedAge = Int()

    // Sets the number of sections in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of PickerView components to match ageData
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageData.count
    }

    // Sets the PickerView component text
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 30)
        label.text =  ageData[row]
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    // Function to set users age when a value is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // save selected age
        print(ageData[row])
        let selectedAge = Int(ageData[row])
        personInstance.setAge(newAge: selectedAge ?? 0)
        storedAge = selectedAge ?? 0
        // enable next button
        nextButton.isUserInteractionEnabled = true
        nextButton.alpha = 1
    }
    // Creates a gradient layer
    let layer = CAGradientLayer()
    
    // Saves user selected age value to core data
    @IBAction func saveData(_ sender: Any) {
        //Deletes previous value
        DeleteAllData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(storedAge, forKey: "number")
        //Saves storedAge to core data
        do {
            try context.save()
            print("Saved to core data")
        } catch {
            print("Failed saving")
        }
    }
    
    // Fetches core data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        // Sets storedAge to core data value
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                storedAge = data.value(forKey: "number") as! Int
                print("GetData() \nscore = \(storedAge)")
            }
        } catch {
            print("getData failed")
        }
    }
    
    // Deletes current core data
    func DeleteAllData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Entity"))
        // Deletes all core data from "Entity"
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetches the core data first
        getData()
        // Setting bounds and color for gradient layer
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        // Inserts gradient layer to the background
        view.layer.insertSublayer(layer, at: 0)
        // Hides navigation bar
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true
        // Sets ageQuestionLabel text to corrent language
        ageQuestionLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "age_question", comment: "")
        ageQuestionLabel.textColor = .white
        ageQuestionLabel.font = UIFont (name: "Helvetica Neue", size: 20)
        // Sets nextButton text to corrent language
        nextButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "next_text", comment: ""), for: .normal)
        // PickerView setup
        agePicker.delegate = self
        agePicker.dataSource = self
        // button properties + disabled next-button on startup
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        nextButton.titleLabel?.lineBreakMode = .byWordWrapping
        nextButton.layer.cornerRadius = 17
        nextButton.layer.borderWidth = 1
    }
    
    // MARK: Outlets
    @IBOutlet weak var ageQuestionLabel: UILabel!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
