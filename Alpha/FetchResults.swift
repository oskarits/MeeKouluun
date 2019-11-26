//
//  FetchResults.swift
//  Alpha
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Jari Pietikäinen, Tuomas Paavolainen, Oskari Sieranen, Otto Söderlund. All rights reserved.
//

import UIKit

class FetchResults: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    //var articles: [Article]? = []
    
    var results: [SingleResult] = []
    
    let layer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layer.frame = view.bounds
        layer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        view.layer.insertSublayer(layer, at: 0)
        fetch()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func fetch(){
        let urlRequest = URLRequest(url: URL(string: "http://localhost:7000/")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            self.results = [SingleResult]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let resultsFromJson = json["results"] as? [[String: AnyObject]] {
                    for resultFromJson in resultsFromJson {
                        let result = SingleResult()
                        if let organisation = resultFromJson["organisation"] as? String, let faculty = resultFromJson["faculty"] as? String, let location = resultFromJson["location"] as? String, let language = resultFromJson["language"] as? String, let amkUni = resultFromJson["amkUni"] as? String, let duration = resultFromJson["duration"] as? String, let url = resultFromJson["url"] as? String
                        {
                            result.organisation = organisation
                            result.faculty = faculty
                            result.location = location
                            result.language = language
                            result.amkUni = amkUni
                            result.duration = duration
                            result.url = url
                        }
                        self.results.append(result)
                    }
                    print("RESPONSE: \n\(self.results)")
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "results Cell", for: indexPath) as! ResultsCell
        /*
         cell.title.text = self.articles?[indexPath.item].headline
         cell.desc.text = self.articles?[indexPath.item].desc
         cell.author.text = self.articles?[indexPath.item].author
         print("\(String(describing: self.articles?[indexPath.item].headline))")
         print("\(String(describing: self.articles?[indexPath.item].desc))")
         print("\(String(describing: self.articles?[indexPath.item].author))")
         cell.imgView.image = UIImage(named: "defaultImage")
         cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imageUrl ?? "defaultImage")!)
         */        //Bind to cell outlets here like above.

        cell.organisation.text = self.results[indexPath.item].organisation
        cell.faculty.text = self.results[indexPath.item].faculty
        cell.location.text = self.results[indexPath.item].location
        cell.language.text = self.results[indexPath.item].language
        cell.amkUni.text = self.results[indexPath.item].amkUni
        cell.duration.text = self.results[indexPath.item].duration
        cell.url.text = self.results[indexPath.item].url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController
        /*
         vc?.image = self.articles?[indexPath.item].imageUrl ?? "defaultImage"
         
         vc?.titleText = self.articles?[indexPath.item].headline ?? "fail title"
         vc?.articleText = self.articles?[indexPath.item].desc ?? "fail text"
         
         vc?.authorText = self.articles?[indexPath.item].author ?? "fail author"
         print(vc?.image ?? "no image")
         print(vc?.titleText  ?? "no title")
         print(vc?.articleText  ?? "no text")
         print(vc?.authorText ?? "no author")
         */
        // BIND HERE
        vc?.organisation = self.results[indexPath.item].organisation ?? "fail organisation"
        vc?.faculty = self.results[indexPath.item].faculty ?? "fail faculty"
        vc?.location = self.results[indexPath.item].location ?? "fail location"
        vc?.language = self.results[indexPath.item].language ?? "fail language"
        vc?.amkUni = self.results[indexPath.item].amkUni ?? "fail amkUni"
        vc?.duration = self.results[indexPath.item].duration ?? "fail duration"
        vc?.url = self.results[indexPath.item].url ?? "fail url"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count //?? 0
    }
    
}











