//
//  LoginController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//

import UIKit

class LoginController: UIViewController {
    
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
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
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let newAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't Have an account? ", "Sign Up!")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        AuthService.shared.logUserIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error logging in \(error.localizedDescription)")
                return
            }
            print("Logged in!")
            
            var firstKeyWindowForConnectedScenes: UIWindow? {
                UIApplication.shared
                    // Of all connected scenes...
                    .connectedScenes.lazy

                    // ... grab all foreground active window scenes ...
                    .compactMap { $0.activationState == .foregroundActive ? ($0 as? UIWindowScene) : nil }

                    // ... finding the first one which has a key window ...
                    .first(where: { $0.keyWindow != nil })?

                    // ... and return that window.
                    .keyWindow
            }
            firstKeyWindowForConnectedScenes?.rootViewController = MainTabController()
            MainTabController().authenticateUserAndConfigureUI()

            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        view.addSubview(logoImage)
        logoImage.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImage.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainer, passwordContainer,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
        paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(newAccountButton)
        newAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                                paddingLeft: 40, paddingRight: 40)
    }
    
}
