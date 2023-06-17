//
//  RegistrationController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class RegistrationController: UIViewController {
    
    private let imageSelector = UIImagePickerController()
    private var profileImage: UIImage?
    
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
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        
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
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
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
        present(imageSelector, animated: true, completion: nil)
    }
    
    @objc func handleRegistration() {
        guard let profileImage = profileImage else {
            print("DEBUG: Please select a profile picture")
            return
        }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let name = fullnameTextField.text else { return }
        guard let username = usernameTextField.text else { return}
        
        let credentials = AuthCredentials(email: email, password: password, fullname: name, username: username, profileImage: profileImage)
        AuthService.shared.registerUser(credentials: credentials) { (error, ref) in
            print("DEBUG: Handle updating the UI")
            
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
    
    func configureUI() {
        
        view.backgroundColor = .twitterBlue
        
        imageSelector.delegate = self
        imageSelector.allowsEditing = true
        
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        addPhotoButton.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [fullnameContainer,
                                                   usernameContainer,
                                                   emailContainer,
                                                   passwordContainer,
                                                   signupButton])
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

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        
        addPhotoButton.layer.cornerRadius = 64
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.imageView?.contentMode = .scaleToFill
        addPhotoButton.imageView?.clipsToBounds = true
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.borderWidth = 3
        
        self.addPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
