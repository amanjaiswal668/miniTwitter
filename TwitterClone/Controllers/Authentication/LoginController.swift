//
//  LoginController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 20/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginController: UIViewController {
    
    //    Setting up logo image view.
    
    private let logoImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        
        return iv
    }()
    
    //    MARK: - Container views for login and password.
    
    private lazy var emailContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: passwordTextField)
        return view
    }()
    
    //    MARK: - Creating class for email and password text field.
    
    private let emailTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    //   Setting up login button.
    
    private let loginButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        button.addTarget(self,
                         action: #selector(handleLogin),
                         for: .touchUpInside)
        return button
    }()
    
    //    Setting up dont have an account button.
    
    private let dontHaveAccountButton: UIButton = {
        
        let button = Utilities().attributedButton("Don't have an account? ", " SignUp")
        button.addTarget(self,
                         action: #selector(handleShowSignUp),
                         for: .touchUpInside)
        return button
    }()
    //MARK: - ----------------------------------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        Calling configureUI function.
        configureUI()
    }
    
    
    //  MARK: - Selectors, signing in users after authentication.
    
    @objc func handleLogin(){
        
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        //        AuthServire is a struct defined in AuthenticationServices.
        
        AuthService.shared.logUserIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                
                print("error logging user\(error)")
                return
            }
            
            guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {return}
            
            //            print("user logged in.")
            guard let tabController = window.rootViewController as? MainTabViewController
                else {return}
            
            tabController.authenticateUserAndConfigureUI()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    //    Transistion to signup screen from login screen.
    
    @objc func handleShowSignUp(){
        
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    //    MARK: - Helpers.
    //    MARK: - Setting up function for configuring UI.
    
    func configureUI(){
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .twitterBlue
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view,
                              topAnchor: view.safeAreaLayoutGuide.topAnchor)
        
        logoImageView.setDimensions(width: 150,
                                    height: 150 )
        
        
        //    MARK: - Creating a stack view programatically.
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        //        Setting don't have account button.
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 40,
                                     paddingRight: 40)
    }
}
