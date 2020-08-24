//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 24/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .magenta
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
