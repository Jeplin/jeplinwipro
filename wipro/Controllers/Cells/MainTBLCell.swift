//
//  MainTBLCell.swift
//  wipro
//
//  Created by John on 26/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit

class MainTBLCell: UITableViewCell {
    
    lazy var vContainer:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.backgroundColor = COLOR.BG
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var lblTitle:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str: "Title")
        return lbl
    }()
    
    lazy var lblDescription:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str: "My Description")
        return lbl
    }()
    
    lazy var imgPhoto:CustomIMG={
        let img = CustomIMG(image: IMAGES.LOADING)
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(vContainer)
        self.addSubview(lblTitle)
        self.addSubview(lblDescription)
        self.addSubview(imgPhoto)
        
        self.selectionStyle = .none
        
        setupLayout()
    }
    //MARK:- Setup Layout Constraints
    func setupLayout(){
        
        imgPhoto.anchorWith_TopLeftBottomRight_Padd(top: topAnchor, left: leadingAnchor, bottom: nil, right: nil,padd: .init(top: 30, left: 30, bottom: 0, right: 0))
        imgPhoto.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 60, constHeight: 60)
        
        lblTitle.anchorWith_TopLeftBottomRight_Padd(top: self.topAnchor, left: imgPhoto.trailingAnchor, bottom: nil, right: trailingAnchor,padd: .init(top: 30, left: 10, bottom: 0, right: -30))
        
        lblDescription.anchorWith_TopLeftBottomRight_Padd(top: lblTitle.bottomAnchor, left: lblTitle.leadingAnchor, bottom: bottomAnchor, right: lblTitle.trailingAnchor,padd: .init(top: 10, left: 0, bottom: -30, right: 0))
        
        vContainer.anchorWith_TopLeftBottomRight_Padd(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor,padd: .init(top: 5, left: 10, bottom: -5, right: -10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
