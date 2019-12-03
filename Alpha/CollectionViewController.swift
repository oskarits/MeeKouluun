//
//  CollectionViewController.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    let textView1: UITextView = {
        let textView = UITextView()
        textView.text = "textView1"
        //textView.font = UIFont.boldSystemFont(ofSize: 15) //font size BOLD
        textView.font = UIFont.systemFont(ofSize: 15) //font size
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        textView.backgroundColor = nil
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView1)
        view.backgroundColor = .white
        
        
        setupBottomControls()
        setupLayout()
    }
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        //button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //button.setTitleColor(.white, for: .normal)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        
        return button
    }()
    
    fileprivate func setupBottomControls() {
        view.addSubview(previousButton)
        //previousButton.backgroundColor = .yellow
        // previousButton.frame = CGRect(x: 0,y: 0, width: 200, height: 50)
        view.addSubview(nextButton)
        //nextButton.backgroundColor = .blue
        //nextButton.frame = CGRect(x: 0,y: 0, width: 200, height: 50)
        
        /*
         let yellowView = UIView()
         yellowView.backgroundColor = .yellow
         
         let blueView = UIView()
         blueView.backgroundColor = .blue
         
         let greenView = UIView()
         greenView.backgroundColor = .green
         */
        
        
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlStackView.distribution = .fillEqually
        
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlStackView)
        
        
        NSLayoutConstraint.activate([
            //bottomControlStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    private func setupLayout() {
        
        textView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textView1.textColor = .black
        
    }
    
}

