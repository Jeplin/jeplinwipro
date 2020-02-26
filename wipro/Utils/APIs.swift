//
//  APIs.swift
//  wipro
//
//  Created by John on 26/02/20.
//  Copyright © 2020 John. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class APIs{
    
    static let BASE_URL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    public static func getData(completion:@escaping (Any?)->Void){
        
        Alamofire.request(BASE_URL, method: .get, parameters: [:], encoding: JSONEncoding.default).responseString { (response) in
            if let result = response.value{
                let strData = result
                let data = strData.data(using: .utf8)
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data!, options : .allowFragments) as? [String:Any]
                    {
                        completion(jsonArray)
                    } else {
                        completion(STRINGS.BAD_JSON)
                    }
                } catch let error as NSError {
                    print(error)
                    completion(error.localizedDescription)
                }
            }
            else{
                completion(STRINGS.SERVER)
            }
            
            

        }
        
    }
    
}
