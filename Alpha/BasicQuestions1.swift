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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageData.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 30)
        label.text =  ageData[row]
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // save selected age
        print(ageData[row])
        let selectedAge = Int(ageData[row])
        personInstance.setAge(newAge: selectedAge ?? 0)
        
        // enable next button
        nextButton.isUserInteractionEnabled = true
        nextButton.alpha = 1
        
        
    }
    let layer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.hidesBackButton = true

        /*
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        //layer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        //view.layer.addSublayer(layer)
        view.layer.insertSublayer(layer, at: 0)
        */
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundGradient")!)
        ageQuestionLabel?.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "age_question", comment: "")
        ageQuestionLabel.textColor = .white
        ageQuestionLabel.font = UIFont (name: "Helvetica Neue", size: 20)
        nextButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "next_text", comment: ""), for: .normal)
        
        // Do any additional setup after loading the view.
        
        // pickerview setup
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
