//
//  PageCell.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
//PageCell creates components to CollectionView in CollectionViewController
class PageCell: UICollectionViewCell {
    
    //questionTextView displays questions
    let questionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15) //font size
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.backgroundColor = nil
        return textView
    }()
    
    //Button1 displayes the first answer option
    let Button1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
        return button
    }()
    
    //Button2 displayes the second answer option
    let Button2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
        return button
    }()
    
    //Button3 displayes the third answer option
    let Button3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
        return button
    }()
    
    //Button4 displayes the fourth answer option
    let Button4: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
        return button
    }()
    
    //Button5 displayes the fifth answer option
    let Button5: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        let widthContraints =  NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
        let heightContraints = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([heightContraints,widthContraints])
        return button
    }()
    
    //ResultButton takes user to results after all questions have been answered
    let resultButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let textColor = UIColor(red: 1, green: 0.22, blue: 0.89, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.isUserInteractionEnabled = false
        button.alpha = 0.5
        return button
    }()
    
    //Initializes the collectionview frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        //Set up is done by function
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    //Adding components to view and setting up layouts
    private func setupLayout() {
        /*Adds all the component to the list of subviews.*/
        self.contentView.addSubview(questionTextView)
        self.contentView.addSubview(Button1)
        self.contentView.addSubview(Button2)
        self.contentView.addSubview(Button3)
        self.contentView.addSubview(Button4)
        self.contentView.addSubview(Button5)
        self.contentView.addSubview(resultButton)
        //Adds the answer buttons to stackview
        let buttonStackView = UIStackView(arrangedSubviews: [Button1, Button2, Button3, Button4, Button5])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fill
        //Sets up stackview's position in the frame
        buttonStackView.layoutMargins = UIEdgeInsets(top: 300, left: (frame.width/2) - (300/2), bottom: 0, right: (frame.width/2) - (300/2))
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        //Adds the stackview as subview
        self.contentView.addSubview(buttonStackView)
        //Constraints
        questionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionTextView.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
        questionTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        questionTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        resultButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultButton.topAnchor.constraint(equalTo: topAnchor, constant: 700).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
