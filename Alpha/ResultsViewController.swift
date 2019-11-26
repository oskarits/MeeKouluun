//
//  ResultsViewController.swift
//  Alpha
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Jari Pietikäinen, Tuomas Paavolainen, Oskari Sieranen, Otto Söderlund. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var singleOrganisation: UILabel!
    @IBOutlet weak var singleFaculty: UILabel!
    @IBOutlet weak var singleLocation: UILabel!
    @IBOutlet weak var singleLanguage: UILabel!
    @IBOutlet weak var singleAmkUni: UILabel!
    @IBOutlet weak var singleDuration: UILabel!
    @IBOutlet weak var singleUrl: UILabel!
    // Add single view outlets here!
    
    var organisation = ""
    var faculty = ""
    var location = ""
    var language = ""
    var amkUni = ""
    var duration = ""
    var url = ""
    
   /* var image = ""
    var titleText = ""
    var articleText = ""
    var authorText = "" */
    
    let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.frame = view.bounds
        layer.colors = [UIColor.green.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        
        // Set variable to outlets here!
        singleOrganisation.text = organisation
        singleFaculty.text = faculty
        singleLocation.text = location
        singleLanguage.text = language
        singleAmkUni.text = amkUni
        singleDuration.text = duration
        singleUrl.text = url
    }
}
