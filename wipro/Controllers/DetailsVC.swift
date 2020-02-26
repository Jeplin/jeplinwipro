//
//  DetailsVC.swift
//  wipro
//
//  Created by John on 26/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
//MARK:- Components
    lazy var imgPhoto:CustomIMG={
        let img = CustomIMG(image: IMAGES.LOADING)
        return img
    }()
    
    lazy var lblTitle:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str: "Title")
        return lbl
    }()
    
    lazy var lblDescription:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str: "Description")
        return lbl
    }()
    //MARK:- Variable
    var DetailData=NSDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details View"

        setViewBackground()
        setSubview()
        
        initialDataLoad()
    }
    
    func initialDataLoad(){
        if DetailData.count != 0{
        
            if let title = DetailData["title"] as? String{
                lblTitle.text = title
                self.title = title
            }
            else{
                lblTitle.text = "NA"
            }
            if let description = DetailData["description"]as? String{
                lblDescription.text = description
            }
            else{
                lblDescription.text = "NA"
            }
            
            if let strImage = DetailData["imageHref"] as? String{
                let url = URL(string: strImage)
//                imgPhoto.load(url: url!)
                imgPhoto.kf.setImage(with: url!,placeholder: IMAGES.LOADING,options: [.cacheOriginalImage])
            }
        }
    }
    
    func setSubview(){
        view.addSubview(imgPhoto)
        view.addSubview(lblTitle)
        view.addSubview(lblDescription)
        
        setupLayout()
    }
}
//MARK:- Setup Layout Constraints
extension DetailsVC{
    func setupLayout(){
        imgPhoto.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil,padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        imgPhoto.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.6, constHeight: 80)
        
        lblTitle.anchorWith_TopLeftBottomRight_Padd(top: imgPhoto.bottomAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, right: view.safeAreaLayoutGuide.trailingAnchor,padd: .init(top: 20, left: 20, bottom: 0, right: -20))
        
        lblDescription.anchorWith_TopLeftBottomRight_Padd(top: lblTitle.bottomAnchor, left: lblTitle.leadingAnchor, bottom: nil, right: lblTitle.trailingAnchor,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
    }
}
