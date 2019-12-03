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
        textView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView1.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        textView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
}
