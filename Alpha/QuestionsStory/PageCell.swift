//
//  PageCell.swift
//  Alpha
//
//  Created by iosdev on 03/12/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textView1: UITextView = {
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
    
    let ResultButton: UIButton = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    private func setupLayout() {
        self.contentView.addSubview(textView1)
        self.contentView.addSubview(Button1)
        self.contentView.addSubview(Button2)
        self.contentView.addSubview(Button3)
        self.contentView.addSubview(Button4)
        self.contentView.addSubview(Button5)
        self.contentView.addSubview(ResultButton)
        
        let buttonStackView = UIStackView(arrangedSubviews: [Button1, Button2, Button3, Button4, Button5])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fill
        buttonStackView.layoutMargins = UIEdgeInsets(top: 300, left: (frame.width/2) - (300/2), bottom: 0, right: (frame.width/2) - (300/2))
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        self.contentView.addSubview(buttonStackView)
        
        textView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView1.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
        textView1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        ResultButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ResultButton.topAnchor.constraint(equalTo: topAnchor, constant: 700).isActive = true
        ResultButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ResultButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
