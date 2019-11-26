//
//  Results.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

    class Results: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        @IBOutlet weak var tableview: UITableView!
        var articles: [Article]? = []
        
        let layer = CAGradientLayer()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            layer.frame = view.bounds
            layer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x:1, y:1)
            view.layer.insertSublayer(layer, at: 0)
            fetchArticles()
        }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 0
        }
        
        func fetchArticles(){
            let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=09b9d62009e1488ca56bd427689ae81f")!)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                self.articles = [Article]()
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                        for articleFromJson in articlesFromJson {
                            let article = Article()
                            if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                                
                                article.author = author
                                article.headline = title
                                article.desc = desc
                                article.url = url
                                article.imageUrl = urlToImage
                            }
                            self.articles?.append(article)
                        }
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
            
            cell.title.text = self.articles?[indexPath.item].headline
            cell.desc.text = self.articles?[indexPath.item].desc
            cell.author.text = self.articles?[indexPath.item].author
            print("\(String(describing: self.articles?[indexPath.item].headline))")
            print("\(String(describing: self.articles?[indexPath.item].desc))")
            print("\(String(describing: self.articles?[indexPath.item].author))")
            cell.imgView.image = UIImage(named: "defaultImage")
            cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imageUrl ?? "defaultImage")!)
            
            
            return cell
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(
                withIdentifier: "ArticleViewController") as? ArticleViewController
            vc?.image = self.articles?[indexPath.item].imageUrl ?? "defaultImage"
            vc?.titleText = self.articles?[indexPath.item].headline ?? "fail title"
            vc?.articleText = self.articles?[indexPath.item].desc ?? "fail text"
            vc?.authorText = self.articles?[indexPath.item].author ?? "fail author"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.articles?.count ?? 0
        }
        
    }
    
    extension UIImageView {
        func downloadImage(from url: String){
            let urlRequest = URLRequest(url: URL(string: url)!)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
}



//print("\()")
//print("\()")























