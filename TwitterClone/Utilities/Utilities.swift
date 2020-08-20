//
//  Utilities.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 20/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class Utilities {
    
    //    MARK: - Setting up containerview for the fields.
    
    func inputContainerView(withImage image : UIImage,
                            textField : UITextField) -> UIView {
        
        let view = UIView()
        let iv = UIImageView()
        
        //        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.anchor( left: view.leftAnchor,
                   bottom: view.bottomAnchor,
                   paddingLeft: 8,
                   paddingBottom: 8 )
        
        iv.setDimensions(width: 24,
                         height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 8,
                         paddingBottom: 8)
        
        let dividerView = UIView()
        
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        
        dividerView.anchor(left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           paddingLeft: 8,
                           height: 0.75)
        return view
    }
    
    //    Setting up function for customizing UITextfileds.
    
    func textField(withPlaceholder placeholder: String) -> UITextField{
        
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
    //    Setting up function for customizing UIButton.
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton  {
        
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart,
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: secondPart,
                                                  attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                               NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle,
                                  for: .normal)
        return button
    }
}
