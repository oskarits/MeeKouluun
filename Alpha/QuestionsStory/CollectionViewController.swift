//
//  CollectionViewController.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
//Question is a placeholder for the fetched questions
struct Question {
    var questionText: String?
}
//Answer is a placeholder for the fetched answers
struct Answer {
    var answerText: String?
}
//Id is a placeholder for the fetched id
struct Id {
    var idNumber: Int?
}
//CollectionViewController defines methods that allow you to manage the selection and highlighting of items in a collection view and to perform actions on those items and creates a grid-based layout.
class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Placeholder for the fetched questions.
    var questions = [Question(questionText: "Error")]
    /*Placeholders for the fetched answers.*/
    var answers1 = [Answer(answerText: "Error")]
    var answers2 = [Answer(answerText: "Error")]
    var answers3 = [Answer(answerText: "Error")]
    var answers4 = [Answer(answerText: "Error")]
    var answers5 = [Answer(answerText: "Error")]
    var answers6 = [Answer(answerText: "Error")]
    //Placeholder for the fetched id.
    var idvalue = [Id(idNumber: 0)]
    //results holds the values of objects in each collectionview page
    var results: [SinglePage] = []
    /*check1 to check10 are used for verifying if all the questions have been aswered*/
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
    //Indicator boolean value for verifying if all the questions have been aswered
    var allAnswered = false
    //Creating a horizontal collectionview
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
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
        //Sets background color
        //view.backgroundColor = .white
        //Adds collectionView to view
        view.addSubview(collectionView)
        //The object that acts as the delegate of the collection view.
        collectionView.delegate = self
        //The object that provides the data for the collection view.
        collectionView.dataSource = self
        //Register a class for use in creating new collection view cells.
        collectionView.register(PageCell.self,
                                forCellWithReuseIdentifier: "cell")
        //Enables paging for the scroll view
        collectionView.isPagingEnabled = true
        //Hides navigationbar
        self.navigationController?.isNavigationBarHidden = true
        //Sets up constraits for the collectionView
        setupCollectionConstraints()
        //Fetches results from url for questions and answers
        fetch()
    }
    
    //Fetches results from url for questions and answers
    func fetch(){
        //URL load request.
        let urlRequest = URLRequest(url: URL(string: LocalizationSystem.sharedInstance.localizedStringForKey(key: "database_link", comment: ""))!)
        //reates a task that retrieves the contents of a URL based on the specified URL request object, and calls a handler upon completion.
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            self.results = [SinglePage]()
            do {
                //Converts between JSON and the equivalent Foundation objects.
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                //Checks if json contains correct values
                if let resultsFromJson = json["questions"] as? [[String: AnyObject]] {
                    for resultFromJson in resultsFromJson {
                        let result = SinglePage()
                        if let question = resultFromJson["question"] as? String?,  let answers = resultFromJson["answers"] as? [String: Any], let id = resultFromJson["id"] as? Int?
                        {
                            //Adds questions to result.question
                            if let questions = question {
                                print(questions)
                                result.question = question
                            }
                            //Adds answer option: a1 to result.answer1
                            if let answ1 = answers["a1"] {
                                print(answ1)
                                let answer = answers["a1"]
                                result.answers1 = answer as! String?
                            }
                            //Adds answer option: a2 to result.answer2
                            if let answ2 = answers["a2"] {
                                print(answ2)
                                let answer = answers["a2"]
                                result.answers2 = answer as! String?
                            }
                            //Adds answer option: a3 to result.answer3
                            if let answ3 = answers["a3"] {
                                print(answ3)
                                let answer = answers["a3"]
                                result.answers3 = answer as! String?
                            }
                            //Adds answer option: a4 to result.answer4
                            if let answ4 = answers["a4"] {
                                print(answ4)
                                let answer = answers["a4"]
                                result.answers4 = answer as! String?
                            }
                            //Adds answer option: a5 to result.answer5
                            if let answ5 = answers["a5"] {
                                print(answ5)
                                let answer = answers["a5"]
                                result.answers5 = answer as! String?
                            }
                            //Adds id to result.id
                            if let idQuestions = id {
                                let idQ = String(idQuestions)
                                result.id = idQuestions as Int?
                                print(idQ)
                            }
                            print("----------------------------")
                        }
                        //Appends result values to corresponding lists
                        self.idvalue.append(Id(idNumber: result.id ?? 0))
                        self.answers1.append(Answer(answerText: result.answers1 ?? "answer error"))
                        self.answers2.append(Answer(answerText: result.answers2 ?? "answer error"))
                        self.answers3.append(Answer(answerText: result.answers3 ?? "answer error"))
                        self.answers4.append(Answer(answerText: result.answers4 ?? "answer error"))
                        self.answers5.append(Answer(answerText: result.answers5 ?? "answer error"))
                        self.questions.append(Question(questionText: result.question ?? "question error"))
                    }
                    print("RESPONSE: \n\(json)")
                }
                DispatchQueue.main.async {
                    print("--self.collectionView.reloadData()--")
                    //Creates the collectioinView with objects and data
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    //Asks the delegate for the spacing between successive rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //Creates the frame for collectionView
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: (view.frame.height) ).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    //Data source object for the number of items in the specified section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count-1 //-1 comes from default value "Error"
    }
    
    //Creates the size of the collectionview's frame
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    //Data source object for the cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Returns a reusable cell object located by its identifier
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        print("")
        print("current index: \(indexPath.item)")
        //Checks the language setting for the ResultButton
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            cell.resultButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "go_to_results", comment: ""), for: .normal)
        } else if LocalizationSystem.sharedInstance.getLanguage() == "fi" {
            cell.resultButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "go_to_results", comment: ""), for: .normal)
        }
        
        
        /*Gives values from correct index*/
        let question = questions[indexPath.item + 1]
        let ans1 = answers1[indexPath.item + 1]
        let ans2 = answers2[indexPath.item + 1]
        let ans3 = answers3[indexPath.item + 1]
        let ans4 = answers4[indexPath.item + 1]
        let ans5 = answers5[indexPath.item + 1]
        let iD = idvalue[indexPath.item + 1]
        /*Gives objects their correct values*/
        cell.questionTextView.text = question.questionText
        cell.Button1.setTitle(ans1.answerText, for: .normal)
        cell.Button2.setTitle(ans2.answerText, for: .normal)
        cell.Button3.setTitle(ans3.answerText, for: .normal)
        cell.Button4.setTitle(ans4.answerText, for: .normal)
        cell.Button5.setTitle(ans5.answerText, for: .normal)
        cell.pageControl.currentPage = (indexPath.item)
        
        //Gives each answer button an unique tag value
        cell.Button1.tag = ((iD.idNumber ?? 0) * 10 ) + 1
        cell.Button2.tag = ((iD.idNumber ?? 0) * 10 ) + 2
        cell.Button3.tag = ((iD.idNumber ?? 0) * 10 ) + 3
        cell.Button4.tag = ((iD.idNumber ?? 0) * 10 ) + 4
        cell.Button5.tag = ((iD.idNumber ?? 0) * 10 ) + 5
        //Gives buttons a target function
        cell.Button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.Button5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.resultButton.addTarget(self, action: #selector(ToResults), for: .touchUpInside)
        //Checks if all questions have been aswered,
        if (self.allAnswered == true) {
            //Makes ResultButton active
            cell.resultButton.isUserInteractionEnabled = true
            cell.resultButton.alpha = 1
            
        }
        //Colors all answer buttons grey
        for i in 11...115 {
            let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
            tempButton?.backgroundColor = .white
        }
        //Reloads all values from check1 to check10
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
        //Colors correct button if it has been clicked, based on tag
        if (check1 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify1)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check2 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify2)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check3 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify3)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check4 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify4)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check5 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify5)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check6 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify6)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check7 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify7)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check8 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify8)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check9 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify9)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        if (check10 > 0) {
            let tempButton = self.view.viewWithTag(Int(checkVerify10)) as? UIButton
            tempButton?.backgroundColor = .lightGray
        }
        return cell
    }
    //Function for answer buttons coloring
    @objc func buttonAction(_ sender: UIButton!){
        //Clicked button displays a highlight glow
        sender.showsTouchWhenHighlighted = true
        //Catches the tag of the selected button
        let buttonTag = sender.tag
        //Colors the selectet button green, and uncolors other buttons in the same page
        switch buttonTag {
        case 11..<16:
            for i in 11...15 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 21..<26:
            for i in 21...25 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 31..<36:
            for i in 31...35 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 41..<46:
            for i in 41...45 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 51..<56:
            for i in 51...55 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 61..<66:
            for i in 61...65 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 71..<76:
            for i in 71...75 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 81..<86:
            for i in 81...85 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 91..<96:
            for i in 91...95 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        case 101..<106:
            for i in 101...105 {
                let tempButton = self.view.viewWithTag(Int(i)) as? UIButton
                tempButton?.backgroundColor = .white
            }
            let tempButton = self.view.viewWithTag(Int(sender.tag)) as? UIButton
            tempButton?.backgroundColor = .lightGray
            
            checkMark(sender)
        default:
            print("button tag error")
        }
    }
    
    //Places the tag of sender button to check1 - check10, to mark the pages questioin aswered and coloring the correct button each controllerView swipe
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
        answerCheck(sender)
    }
    
    //Prints the questions that have been answered.
    func answerCheck(_ sender: UIButton!) {
        let buttonTag = sender.tag
        //Prints out the answered questions. Used for debugging.
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
        //If all questions have been answered
        if (self.check1 > 0 && self.check2 > 0 && self.check3 > 0 && self.check4 > 0 && self.check5 > 0 && self.check6 > 0 && self.check7 > 0 && self.check8 > 0 && self.check9 > 0 && self.check10 > 0 ) {
            print("Unlock Results!!")
            //Makes resultButton active if inactive
            if (self.allAnswered == false) {
                //Changes the current page index to fix bug of selected button color not showing
                switch buttonTag {
                case 11..<16:
                    let nextIndex = IndexPath(item: 9, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 21..<26:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 31..<36:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 41..<46:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 51..<56:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 61..<66:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 71..<76:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 81..<86:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 91..<96:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                case 101..<106:
                    let nextIndex = IndexPath(item: 0, section: 0)
                    self.collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
                default:
                    print("button tag error")
                }
                //Updates the view to get resultButton to be active
                self.collectionView.reloadData()
                self.allAnswered = true
                //Alerts the user that they can either continue or change their answers
                //Alert message is localized
                let alertText = LocalizationSystem.sharedInstance.localizedStringForKey(key: "results_alert", comment: "")
                //Alert title is localized
                let alertTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "alert_title", comment: "")
                let alert = UIAlertController(title: "\(alertTitle)", message: "\(alertText)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                    case .cancel:
                        print("cancel")
                    case .destructive:
                        print("destructive")
                    }}))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //resultButton's function to seque to result
    @objc func ToResults(_ sender: UIButton!) {
        print("Continue to results")
        personInstance.addToScore(0, check1, 0)
        personInstance.addToScore(0, 0, check2)
        personInstance.addToScore(0, 0, check3)
        personInstance.addToScore(0, check4, 0)
        personInstance.addToScore(0, 0, check5)
        personInstance.addToScore(0, check6, 0)
        personInstance.addToScore(check7, 0, 0)
        personInstance.addToScore(check8, 0, 0)
        personInstance.addToScore(check9, 0, 0)
        personInstance.addToScore(check10, 0, 0)
        Transition(sender)
    }
    
    //Performs the segue to results
    func Transition(_ sender: UIButton!) {
        performSegue(withIdentifier: "LoadingSegue", sender: self)
    }
}
