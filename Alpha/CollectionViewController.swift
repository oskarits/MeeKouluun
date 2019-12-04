//
//  CollectionViewController.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
//
//struct CustomData {
//    var title: String
//}
struct Page {
    var titleText: String?
}
struct Answer1 {
    var answerText: String?
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pages = [Page(titleText: "Error")]
    var answers = [Answer1(answerText: "Error")]
    
    var results: [SinglePage] = []

    func fetch(){
        let urlRequest = URLRequest(url: URL(string: "http://users.metropolia.fi/~tuomamp/testDb.json")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            self.results = [SinglePage]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                //-------------------------
                /*
                if let resultsFromJson = json["results"] as? [[String: AnyObject]] {
                    //["questions": <__NSArrayM 0x6000000c12c0>(
                //print("#\n#\n#\n#\n#\n#\n#\n#\n#\n#\n#")
                    for resultFromJson in resultsFromJson {
                        let result = SinglePage()
                        if let organisation = resultFromJson["organisation"] as? String, let faculty = resultFromJson["faculty"] as? String, let location = resultFromJson["location"] as? String, let language = resultFromJson["language"] as? String, /*let amkUni = resultFromJson["amkUni"] as? String, */ let duration = resultFromJson["duration"] as? String, let url = resultFromJson["url"] as? String
                        {
                            result.organisation = organisation
                            result.faculty = faculty
                            result.location = location
                            result.language = language
                            result.duration = duration
                            result.url = url
                        }
                        //self.pages.insert(Page(titleText: result.location), at: 0)

                        self.pages.append(Page(titleText: result.location))
                        self.results.append(result)
                    }
                    print("RESPONSE: \n\(json)")
                }
 */
                //-----------------------------
                if let resultsFromJson = json["questions"] as? [[String: AnyObject]] {
                    //["questions": <__NSArrayM 0x6000000c12c0>(
                    print("#\n#\n#\n#\n#\n#\n#\n#\n#\n#\n#")
                    for resultFromJson in resultsFromJson {
                        let result = SinglePage()
                        if let question = resultFromJson["question"] as? String?,  let answers = resultFromJson["answers"] as? [String: Any], let id = resultFromJson["id"] as? Int?
                        {
                            if let questions = question {
                                print(questions)
                                
                            }
                            if let answ1 = answers["a1"] {
                                print(answ1)
                                let xxx = answers["a1"]
                                result.answers = xxx as! String?
                            }
                            if let answ2 = answers["a2"] {
                                print(answ2)
                            }
                            if let answ3 = answers["a3"] {
                                print(answ3)
                            }
                            if let answ4 = answers["a4"] {
                                print(answ4)
                            }
                            if let answ5 = answers["a5"] {
                                print(answ5)
                            }
                            if let idQuestions = id {
                                let idQ = String(idQuestions)
                                print(idQ)
                            }
                            result.question = question
                            print("----------------------------")
                        }
                        //self.pages.insert(Page(titleText: result.location), at: 0)
                        
                        self.answers.append(Answer1(answerText: result.answers ?? "answer error"))
                        self.pages.append(Page(titleText: result.question ?? "question error"))
                        //self.results.append(result)
                    }
                    print("RESPONSE: \n\(json)")
                }
                //------------------
                DispatchQueue.main.async {
                    print("--self.collectionView.reloadData()--")
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionConstraints()
        fetch()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count-1 //        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        let page = pages[indexPath.item + 1]//        let page = pages[indexPath.item]
        let ans = answers[indexPath.item + 1]
        //cell.backgroundColor = .white
        cell.textView1.text = page.titleText
        cell.Button1.titleLabel?.text = ans.answerText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        //return CGSize(width: 250, height: 100)
    }
    
}
//    var pages = [
//        Page(titleText: "Kysymys: 1: \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//        Page(titleText: "Kysymys: 2: \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//        Page(titleText: "Kysymys: 3: \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//        Page(titleText: "Kysymys: 4: \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//    ]
