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
    @IBOutlet weak var singleDuration: UILabel!
    @IBOutlet weak var singleUrl: UILabel!
    @IBOutlet weak var singleDescription: UILabel!
    @IBOutlet weak var singleAmkUni: UILabel!

    // Add single view outlets here!
    
    var organisationTitle = ""
    var facultyTitle = ""
    var locationTitle = ""
    var languageTitle = ""
    var amkUniTitle = ""
    var durationTitle = ""
    var urlTitle = ""
    var descriptionTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set variable to outlets here!
        singleOrganisation.text = organisationTitle
        singleFaculty.text = facultyTitle
        singleLocation.text = locationTitle
        singleLanguage.text = languageTitle
        singleAmkUni.text = amkUniTitle
        singleDuration.text = durationTitle
        singleUrl.text = urlTitle
        singleDescription.text = descriptionTitle
        
    }
}
