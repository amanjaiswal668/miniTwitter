//
//  ExploreController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class ExploreController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .blue
        configureUI()
    }
    
    
    //MARK: - Helpers.
    //    function for configuring UI.
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
}
