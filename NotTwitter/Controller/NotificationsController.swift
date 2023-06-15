//
//  NotificationsController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit

class NotificationsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
