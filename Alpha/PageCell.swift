//
//  PageCell.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    //    var page: Page? {
    //        didSet {
    //            print(page?.titleText ?? "page error")
    //            guard page != nil else { return }
    //
    //
    //        }
    //    }
    
    
    let textView1: UITextView = {
        let textView = UITextView()
        
        
        textView.text = "textView1"
        textView.font = UIFont.systemFont(ofSize: 15) //font size
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.backgroundColor = nil
        
        return textView
    }()
    
    
    let Button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    let Button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 2", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    let Button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 3", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        //        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    let Button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 4", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        //        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    let Button5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 5", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        //        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setupLayout()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    private func setupLayout() {
        addSubview(textView1)
//        Button1.backgroundColor = UIColor(red: 0.80, green: 0.78, blue: 0.84, alpha: 1)//rgb(0.80,0.78,0.84)
//        Button2.backgroundColor = UIColor(red: 0.80, green: 0.78, blue: 0.84, alpha: 1) //rgb(0.96,0.93,1.00)
        addSubview(Button1)
        addSubview(Button2)
        addSubview(Button3)
        addSubview(Button4)
        addSubview(Button5)


        let buttonStackView = UIStackView(arrangedSubviews: [Button1, Button2, Button3, Button4, Button5])
        buttonStackView.distribution = .equalSpacing//.fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.layoutMargins = UIEdgeInsets(top: 400, left: 20, bottom: 0, right: 20)
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.spacing = 8;

        //        let horizontalConstraint = buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //        let verticalConstraint = buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        addSubview(buttonStackView)
        
        textView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView1.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
        textView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
    }
    
}
