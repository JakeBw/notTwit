//
//  ConversationsController.swift
//  NotTwitter
//
//  Created by Jake on 2023-06-15.
//
import UIKit

class ConversationsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
}
