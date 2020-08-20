//
//  SignUpController.swift
//  TwitterClone
//
//  Created by Aman Jaiswal on 20/08/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //    Setting up image picker controller for profile photo.
    
    private let imagePicker = UIImagePickerController()
    
    //    Setting up profile photo button.
    
    private let plusPhotoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo" ),
                        for: .normal)
        button.tintColor = .white
        button.addTarget(self,
                         action: #selector(handleAddProfilePhoto),
                         for: .touchUpInside)
        return button
    }()
    
    //    MARK: - Container views for login, fullname, username and password.
    
    private lazy var emailContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: emailTextField)
        
        
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: fullNameTextField)
        
        
        return view
    }()
    
    private lazy var userNameContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: userNameTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image,
                                                  textField: passwordTextField)
        
        return view
    }()
    
    //    MARK: - Creating class for login, fullname, username and password textfield.
    
    private let emailTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Email")
        
        return tf
    }()
    
    private let fullNameTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Fullname")
        
        return tf
    }()
    
    private let userNameTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Username ")
        
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    //    Setting up registration button(signUp button).
    
    private let registrationButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        button.addTarget(self,
                         action: #selector(handleRegistration),
                         for: .touchUpInside)
        return button
    }()
    
    //    Setting up already have an account button.
    
    private let alreadyHaveAccountButton: UIButton = {
        
        let button = Utilities().attributedButton("Already have an account? ", " SignIn")
        button.addTarget(self,
                         action: #selector(handleShowLogin),
                         for: .touchUpInside)
        return button
    }()
    
    //    MARK: - ---------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    //MARK: - Selectors
    
    @objc func handleShowLogin(){
        
        navigationController?.popViewController(animated: true)
        print("Add profile photo")
        
    }
    
    @objc func handleRegistration(){
        
        print("SignUp tapped.")
    }
    
    @objc func handleAddProfilePhoto(){
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    //    MARK: - Setting up function for configuring UI.
    
    func configureUI(){
        
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view,
                                topAnchor: view.safeAreaLayoutGuide.topAnchor)
        
        plusPhotoButton.setDimensions(width: 128,
                                      height: 128
        )
        
        
        //        MARK: - Creating a stack view programatically.
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   fullNameContainerView,
                                                   userNameContainerView,
                                                   registrationButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton .anchor(left: view.leftAnchor,
                                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                         right: view.rightAnchor,
                                         paddingLeft: 40,
                                         paddingRight: 40)
    }
}


//MARK: - Creating extensions.

//Extensions for image picker for editing User profile.

extension SignUpViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        
        plusPhotoButton.layer.cornerRadius = 128/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal),
                                      for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
