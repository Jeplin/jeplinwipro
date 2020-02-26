//
//  MainVC.swift
//  wipro
//
//  Created by John on 25/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit
import Kingfisher

class MainVC: UIViewController {
    //MARK:- Components
    lazy var tblMainList:UITableView={
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints=false
        return tbl
    }()
    
    //MARK:- Variable
    var tblIdentifier = "cell"
    var DataList = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Jeplin Wipro"
        setViewBackground()
        initialDataLoad()
        
        setSubview()
        setupTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(handleRefresh))
        
    }
    
    //MARK:- Initial Data load APis
    func initialDataLoad(){
        
        let loader = LoaderView()
        loader.showLoader()
        
        APIs.getData { (records) in
            loader.hideLoader()
            
            if let message = records as? String{
                self.makeToast(strMessage: message)
                return
            }
            
            if let myData = records as? [String:Any]{
                self.initialDataDisplay(data: myData)
            }
        }
        
    }
    
    func initialDataDisplay(data:[String:Any]){
        if let title = data["title"] as? String{
            self.title = title
        }
        if let list = data["rows"] as? NSArray{
            self.DataList = list
        }
        self.tblMainList.reloadData()
    }
    
    func setupTableView(){
        tblMainList.delegate = self
        tblMainList.dataSource = self
        
        tblMainList.register(MainTBLCell.self, forCellReuseIdentifier: tblIdentifier)
        tblMainList.tableFooterView = UIView()
        tblMainList.separatorStyle = .none
        tblMainList.rowHeight = UITableView.automaticDimension
        tblMainList.estimatedRowHeight = 88
        
    }
    
    func setSubview(){
        view.addSubview(tblMainList)
        
        setupLayout()
    }
    
//MARK:- action function
    @objc func handleRefresh(){
        initialDataLoad()
    }

}
//MARK:- Table View Delegate and datasource
extension MainVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tblIdentifier, for: indexPath) as! MainTBLCell
        
        if DataList.count != 0{
            let data = DataList[indexPath.row] as! NSDictionary
            
            if let title = data["title"] as? String{
                cell.lblTitle.text = title
            }
            else{
                cell.lblTitle.text = "NA"
            }
            
            if let description = data["description"]as? String{
                cell.lblDescription.text = description
            }
            else{
                cell.lblDescription.text = "NA"
            }
            
            if let strImage = data["imageHref"] as? String{
                let url = URL(string: strImage)
                cell.imgPhoto.kf.setImage(with: url!,placeholder: IMAGES.LOADING,options: [.cacheOriginalImage])
                
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailsVC()
        detail.DetailData = DataList[indexPath.row] as! NSDictionary
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//MARK:- Setup Layout Constraints
extension MainVC{
    func setupLayout(){
        tblMainList.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.trailingAnchor)
    }
}
