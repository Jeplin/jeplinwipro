//
//  MyExtensions.swift
//  wipro
//
//  Created by John on 25/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

extension UIViewController{
    
    
    func setViewBackground(){
        self.view.backgroundColor = COLOR.BG
    }
    
    //MARK:- Alert and Toast
    func makeToast(strMessage:String){
        var style=ToastStyle()
        style.messageAlignment = .center
        self.view.makeToast(strMessage, duration: 3.0, position: .bottom,style:style)
    }
    
}

extension UILabel{
    func setCustomLBL(str:String){
        self.text = str
        self.textColor = UIColor.black
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
