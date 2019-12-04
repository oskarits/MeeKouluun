//
//  BasicQuestions1.swift
//  Alpha
//
//  Created by Otto on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class BasicQuestions1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // pickerview data variable
    var ageData = (15...100).map{ String($0)}
    
    public var person = Person.init(age: 23)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            person.setAge(newAge: Int(ageData[row])!)
            return ageData[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // save selected age
        print(ageData[row])
        let selectedAge = Int(ageData[row])
        person.setAge(newAge: selectedAge ?? 0)
        
        // enable next button
        nextButton.isUserInteractionEnabled = true
        nextButton.alpha = 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        //layer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        //view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
        
        // Do any additional setup after loading the view.
        
        // pickerview setup
        agePicker.delegate = self
        agePicker.dataSource = self
        
        // disabled next-button on startup
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
    }
    
    // MARK: Outlets
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    /*
     @IBAction func BasicQuestionButton(_ sender: UIButton) {
     Transition(sender.self)
     print("basicQ button 1")
     }
     
     @IBAction func BasicQuestionButton2(_ sender: UIButton!) {
     Transition(sender.self)
     print("basicQ button 2")
     
     }
     private func Transition(_ sender: UIButton!) {
     performSegue(withIdentifier: "segue1", sender: self)
     }
     */
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
