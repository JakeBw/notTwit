//
//  FeedController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit
import SDWebImage


class FeedController: UIViewController {
    
    var user: User? {
        didSet {
            configureLeftBarButton()
            print("Set in feed controller!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView

    }
    func configureLeftBarButton() {
        guard let user = user else { return }
        
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url, completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
