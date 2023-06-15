//
//  RegistrationController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit

class RegistrationController: UIViewController {
    
    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainer: UIView = {
        let image = UIImage(imageLiteralResourceName: "mail 1")
        let view = Utilities().inputContainterView(withImage: image, textField: emailTextField)
        
        return view
    }()
    
    private lazy var passwordContainer: UIView = {
        let image = UIImage(imageLiteralResourceName: "lock")
        let view = Utilities().inputContainterView(withImage: image, textField: passwordTextField)
    
        return view
    }()
    private lazy var fullnameContainer: UIView = {
        let image = UIImage(imageLiteralResourceName: "mail 1")
        let view = Utilities().inputContainterView(withImage: image, textField: fullnameTextField)
        
        return view
    }()
    
    private lazy var usernameContainer: UIView = {
        let image = UIImage(imageLiteralResourceName: "lock")
        let view = Utilities().inputContainterView(withImage: image, textField: usernameTextField)
    
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    private let fullnameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Fullname")
        
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Username")
        
        return tf
    }()
    
    private let alreadyHaveAnAccount: UIButton = {
        let button = Utilities().attributedButton("Already have an account?  ", "Log In!")
        button.addTarget(self, action: #selector(handleHaveAccount), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func handleHaveAccount() {
        navigationController?.popViewController(animated: true)
    }
    @objc func handleProfilePhoto() {
        print("Select a profile picture")
    }
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        addPhotoButton.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [fullnameContainer,
                                                   usernameContainer,
                                                   emailContainer,
                                                   passwordContainer])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAnAccount)
        alreadyHaveAnAccount.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                                paddingLeft: 40, paddingRight: 40)
    }
    
}
