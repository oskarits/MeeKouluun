//
//  ResultsCell.swift
//  Alpha
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Jari Pietikäinen, Tuomas Paavolainen, Oskari Sieranen, Otto Söderlund. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {
    
   // Add outlets here!
    @IBOutlet weak var organisation: UILabel!
    @IBOutlet weak var faculty: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var duration: UILabel!
   // @IBOutlet weak var url: UILabel!
    @IBOutlet weak var amkUni: UILabel!
   // @IBOutlet weak var description: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        
    }
    
}
