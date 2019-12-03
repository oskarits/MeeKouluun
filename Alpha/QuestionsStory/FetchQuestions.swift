//
//  FetchQuestions.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import Foundation
import UIKit

class FetchQuestions: UIViewController {
    
    var questions: [SingleQuestion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchQuestions()
    }
    
    func fetchQuestions(){
        let urlRequest = URLRequest(url: URL(string: "http://users.metropolia.fi/~tuomamp/testDb.json")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            self.questions = [SingleQuestion]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let resultsFromJson = json["questions"] as? [[String: AnyObject]] {
                    for resultFromJson in resultsFromJson {
                        let result = SingleQuestion()
                        if let question = resultFromJson["question"] as? String, let answer1 = resultFromJson["a1"] as? String, let answer2 = resultFromJson["a2"] as? String, let answer3 = resultFromJson["a3"] as? String, let answer4 = resultFromJson["a4"] as? String, let answer5 = resultFromJson["a5"] as? String, let answer6 = resultFromJson["a6"] as? String
                        {
                            result.question = question
                            result.answer1 = answer1
                            result.answer2 = answer2
                            result.answer3 = answer3
                            result.answer4 = answer4
                            result.answer5 = answer5
                            result.answer6 = answer6
                        }
                        self.questions.append(result)
                    }
                    print("RESPONSE: \n\(json)")
                }
               /* DispatchQueue.main.async {
                    self.tableview.reloadData()
                } */
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}


