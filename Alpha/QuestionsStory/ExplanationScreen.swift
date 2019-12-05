//
//  StartQuestionsViewController.swift
//  Alpha
//
//  Created by iosdev on 05/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class ExplanationScreen: UIViewController {

    @IBOutlet weak var StartQuestionsLabel: UILabel!
    @IBOutlet weak var StartQuestionsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        StartQuestionsButton?.setTitle("Let's Get Started!", for: .normal)
        StartQuestionsLabel?.text = "Thank you for filling the basic info.\nNow fill out our quick questionnaire to find out which education suits you the best!"
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
