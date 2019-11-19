//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by iosdev on 17/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var singleImage: UIImageView!
    @IBOutlet weak var singleTitle: UILabel!
    @IBOutlet weak var sigleText: UILabel!
    @IBOutlet weak var singleAuthor: UILabel!
    
    var image = ""
    var titleText = ""
    var articleText = ""
    var authorText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //singleImage.image = image
        print("image =  \(image)")
        singleImage.downloadImage(from: image)
        singleTitle?.text = titleText
        sigleText?.text = articleText
        singleAuthor?.text = authorText

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
