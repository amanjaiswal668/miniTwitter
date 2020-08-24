//
//  CaptionTextView.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 23/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

//MARK: - Creating text view for writing captions i.e tweets in UploadTweetController.

class captionTextView: UITextView {
    
    //    creating placeholder for the casption tweet.
    let placeholderLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"
        
        return label
    }()
    
    
    override init(frame: CGRect,
                  textContainer: NSTextContainer?) {
        super.init(frame: frame,
                   textContainer: textContainer)
        
        //        Setting up UI for the caption tweet.
        
        backgroundColor = .red
        font = .systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 8,
                                paddingLeft: 4)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleTextinputChange),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function for handeling placeholder in Tweet view i.e to dismiss placeholder.
    
    @objc func handleTextinputChange() {
        
        placeholderLabel.isHidden = !text.isEmpty
    }
}
