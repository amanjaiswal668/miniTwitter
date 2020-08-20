//
//  ConversationController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class ConversationController: UIViewController {
    
     override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            
            view.backgroundColor = .green
        configureUI()
        }
        

    //MARK: - Helpers.
    //    function to create all view controllers programatically.
        
        func configureUI(){
            
             view.backgroundColor = .white
            navigationItem.title = "Messages"
        }
}
