//
//  CollectionViewController.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

struct Page {
    var titleText: String?
}
struct Answer1 {
    var answerText: String?
}
struct Answer2 {
    var answerText: String?
}
struct Answer3 {
    var answerText: String?
}
struct Answer4 {
    var answerText: String?
}
struct Answer5 {
    var answerText: String?
}
struct Answer6 {
    var answerText: String?
}
struct Id {
    var idNumber: Int?
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var selectedCells = Set<IndexPath>()
    var isSelectAllActive = false
    
    var pages = [Page(titleText: "Error")]
    var answers1 = [Answer1(answerText: "Error")]
    var answers2 = [Answer2(answerText: "Error")]
    var answers3 = [Answer3(answerText: "Error")]
    var answers4 = [Answer4(answerText: "Error")]
    var answers5 = [Answer5(answerText: "Error")]
    var answers6 = [Answer6(answerText: "Error")]
    var idvalue = [Id(idNumber: 0)]
    //var abc = [0]
    var results: [SinglePage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        //collectionView.allowsMultipleSelection = false//
        
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionConstraints()
        fetch()
    }
    
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
                if let resultsFromJson = json["questions"] as? [[String: AnyObject]] {
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
                                result.answers1 = xxx as! String?
                            }
                            if let answ2 = answers["a2"] {
                                print(answ2)
                                let xxx = answers["a2"]
                                result.answers2 = xxx as! String?
                            }
                            if let answ3 = answers["a3"] {
                                print(answ3)
                                let xxx = answers["a3"]
                                result.answers3 = xxx as! String?
                            }
                            if let answ4 = answers["a4"] {
                                print(answ4)
                                let xxx = answers["a4"]
                                result.answers4 = xxx as! String?
                            }
                            if let answ5 = answers["a5"] {
                                print(answ5)
                                let xxx = answers["a5"]
                                result.answers5 = xxx as! String?
                            }
                            if let idQuestions = id {
                                let idQ = String(idQuestions)
                                result.id = idQuestions as Int?
                                print(idQ)
                            }
                            result.question = question
                            print("----------------------------")
                        }
                        //self.pages.insert(Page(titleText: result.location), at: 0)
                        self.idvalue.append(Id(idNumber: result.id ?? 0))
                        self.answers1.append(Answer1(answerText: result.answers1 ?? "answer error"))
                        self.answers2.append(Answer2(answerText: result.answers2 ?? "answer error"))
                        self.answers3.append(Answer3(answerText: result.answers3 ?? "answer error"))
                        self.answers4.append(Answer4(answerText: result.answers4 ?? "answer error"))
                        self.answers5.append(Answer5(answerText: result.answers5 ?? "answer error"))
                        self.pages.append(Page(titleText: result.question ?? "question error"))
                        //self.results.append(result)
                    }
                    print("RESPONSE: \n\(json)")
                }
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        collectionView.heightAnchor.constraint(equalToConstant: (view.frame.height - 200) ).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count-1 //        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        print("")
        print("current index: \(indexPath.item)")
        
        let page = pages[indexPath.item + 1]//        let page = pages[indexPath.item]
        let ans1 = answers1[indexPath.item + 1]
        let ans2 = answers2[indexPath.item + 1]
        let ans3 = answers3[indexPath.item + 1]
        let ans4 = answers4[indexPath.item + 1]
        let ans5 = answers5[indexPath.item + 1]
        let iD = idvalue[indexPath.item + 1]
        
        cell.textView1.text = page.titleText
        
        cell.Button1.setTitle(ans1.answerText, for: .normal)
        cell.Button2.setTitle(ans2.answerText, for: .normal)
        cell.Button3.setTitle(ans3.answerText, for: .normal)
        cell.Button4.setTitle(ans4.answerText, for: .normal)
        cell.Button5.setTitle(ans5.answerText, for: .normal)
        
        cell.Button1.tag = ((iD.idNumber ?? 0) * 10 ) + 1
        cell.Button2.tag = ((iD.idNumber ?? 0) * 10 ) + 2
        cell.Button3.tag = ((iD.idNumber ?? 0) * 10 ) + 3
        cell.Button4.tag = ((iD.idNumber ?? 0) * 10 ) + 4
        cell.Button5.tag = ((iD.idNumber ?? 0) * 10 ) + 5
        
        cell.Button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        for i in 11...115 {
            let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
            tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
        }
        return cell
    }
    
    
    @objc func buttonAction(_ sender: UIButton!){
        sender.showsTouchWhenHighlighted = true
        
        let buttonTag = sender.tag
        switch buttonTag {
        case 11..<16:
            for i in 11...15 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 21..<26:
            for i in 21...25 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 31..<36:
            for i in 31...35 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 41..<46:
            for i in 41...45 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 51..<56:
            for i in 51...55 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 61..<66:
            for i in 61...65 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 71..<76:
            for i in 71...75 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 81..<86:
            for i in 81...85 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 91..<96:
            for i in 91...95 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        case 101..<106:
            for i in 101...105 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            buttonSelected(sender)
        default:
            print("button tag error")
        }
    }
    
    func buttonSelected(_ sender: UIButton!) {
        let tag = sender.tag
        print("Button tag: \(tag)")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        //return CGSize(width: 250, height: 100)
    }
}
