//
//  Utilities.swift
//  NotTwitterTests
//
//  Created by Jake on 2023-06-15.
//

import UIKit

class Utilities {
    
    func inputContainterView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        iv.image = image
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        return
    }
    
}
