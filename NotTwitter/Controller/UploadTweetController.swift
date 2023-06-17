//
//  UploadTweetController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-17.
//

import UIKit

class UploadTweetController: UIViewController {
    
    private let user: User
    
    private lazy var actionButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.backgroundColor = .twitterBlue
        
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
        
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .systemPink
        return iv
    }()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUploadTweet() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                                paddingTop: 16, paddingLeft: 16)
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
    
}
