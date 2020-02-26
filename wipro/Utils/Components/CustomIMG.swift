//
//  CustomIMG.swift
//  wipro
//
//  Created by John on 26/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import Foundation
import UIKit

class CustomIMG:UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        
        if image != nil{
            self.image = image
        }
        
        self.translatesAutoresizingMaskIntoConstraints=false
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
