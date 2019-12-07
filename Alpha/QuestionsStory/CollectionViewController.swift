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
struct Answer {
    var answerText: String?
}
struct Id {
    var idNumber: Int?
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var selectedCells = Set<IndexPath>()
    var isSelectAllActive = false
    
    var pages = [Page(titleText: "Error")]
    var answers1 = [Answer(answerText: "Error")]
    var answers2 = [Answer(answerText: "Error")]
    var answers3 = [Answer(answerText: "Error")]
    var answers4 = [Answer(answerText: "Error")]
    var answers5 = [Answer(answerText: "Error")]
    var answers6 = [Answer(answerText: "Error")]
    var idvalue = [Id(idNumber: 0)]
    var results: [SinglePage] = []
    var check1 = 0
    var check2 = 0
    var check3 = 0
    var check4 = 0
    var check5 = 0
    var check6 = 0
    var check7 = 0
    var check8 = 0
    var check9 = 0
    var check10 = 0
    var allAnswered = false
    
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
                        self.answers1.append(Answer(answerText: result.answers1 ?? "answer error"))
                        self.answers2.append(Answer(answerText: result.answers2 ?? "answer error"))
                        self.answers3.append(Answer(answerText: result.answers3 ?? "answer error"))
                        self.answers4.append(Answer(answerText: result.answers4 ?? "answer error"))
                        self.answers5.append(Answer(answerText: result.answers5 ?? "answer error"))
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
        
        collectionView.heightAnchor.constraint(equalToConstant: (view.frame.height) ).isActive = true
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
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            cell.ResultButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "go_to_results", comment: ""), for: .normal)
        } else if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            cell.ResultButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "go_to_results", comment: ""), for: .normal)
        }
        
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
        cell.ResultButton.addTarget(self, action: #selector(ToResults), for: .touchUpInside)

        
        if (self.allAnswered == true) {
            cell.ResultButton.isUserInteractionEnabled = true
            cell.ResultButton.alpha = 1
        }
        for i in 11...115 {
            let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
            tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
        }
        let checkVerify1 = check1
        let checkVerify2 = check2
        let checkVerify3 = check3
        let checkVerify4 = check4
        let checkVerify5 = check5
        let checkVerify6 = check6
        let checkVerify7 = check7
        let checkVerify8 = check8
        let checkVerify9 = check9
        let checkVerify10 = check10

        if (check1 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify1)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check2 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify2)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check3 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify3)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check4 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify4)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check5 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify5)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check6 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify6)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check7 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify7)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check8 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify8)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check9 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify9)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        if (check10 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify10)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
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
            checkMark(sender)
        case 21..<26:
            for i in 21...25 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 31..<36:
            for i in 31...35 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 41..<46:
            for i in 41...45 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 51..<56:
            for i in 51...55 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 61..<66:
            for i in 61...65 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 71..<76:
            for i in 71...75 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 81..<86:
            for i in 81...85 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 91..<96:
            for i in 91...95 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
        case 101..<106:
            for i in 101...105 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0)
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            checkMark(sender)
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
    func checkMark(_ sender: UIButton!) {
        
        let buttonTag = sender.tag
        switch buttonTag {
        case 11..<16:
            self.check1 = sender.tag
            print(check1)
        case 21..<26:
            self.check2 = sender.tag
            print(check2)
        case 31..<36:
            self.check3 = sender.tag
            print(check3)
        case 41..<46:
            self.check4 = sender.tag
            print(check4)
        case 51..<56:
            self.check5 = sender.tag
            print(check5)
        case 61..<66:
            self.check6 = sender.tag
            print(check6)
        case 71..<76:
            self.check7 = sender.tag
            print(check7)
        case 81..<86:
            self.check8 = sender.tag
            print(check8)
        case 91..<96:
            self.check9 = sender.tag
            print(check9)
        case 101..<106:
            self.check10 = sender.tag
            print(check10)
        default:
            print("tag check error")
        }
        answerCheck()
    }
    
    func answerCheck() {
//        for i in 1...10 {
//
//        }
        if (self.check1 > 0 ){
            print("Q1 answered")
        }
        if (self.check2 > 0 ){
            print("Q2 answered")
        }
        if (self.check3 > 0 ){
            print("Q3 answered")
        }
        if (self.check4 > 0 ){
            print("Q4 answered")
        }
        if (self.check5 > 0 ){
            print("Q5 answered")
        }
        if (self.check6 > 0 ){
            print("Q6 answered")
        }
        if (self.check7 > 0 ){
            print("Q7 answered")
        }
        if (self.check8 > 0 ){
            print("Q8 answered")
        }
        if (self.check9 > 0 ){
            print("Q9 answered")
        }
        if (self.check10 > 0 ){
            print("Q10 answered")
        }

        if (self.check1 > 0 && self.check2 > 0 && self.check3 > 0 && self.check4 > 0 && self.check5 > 0 && self.check6 > 0 && self.check7 > 0 && self.check8 > 0 && self.check9 > 0 && self.check10 > 0 ) {
            print("Unlock Results!!")
            self.allAnswered = true
            collectionView.reloadData()
        }
    }
    
    @objc func ToResults(_ sender: UIButton!) {
        print("Continue to results")
        Transition(sender)
        
    }
    
    func Transition(_ sender: UIButton!) {
        performSegue(withIdentifier: "LoadingSegue", sender: self)
    }
}
