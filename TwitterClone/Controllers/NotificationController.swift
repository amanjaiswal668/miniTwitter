//
//  NotificationController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 19/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class NotificationContorller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .purple
        configureUI()
    }
    
    
    //MARK: - Helpers.
    //    function for configuring UI.
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
