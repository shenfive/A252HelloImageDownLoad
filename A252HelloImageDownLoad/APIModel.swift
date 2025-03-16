//
//  APIModel.swift
//  A252HelloImageDownLoad
//
//  Created by DannyShen on 2025/3/16.
//

import Foundation
import Alamofire

class APIModel{
    static var share = APIModel()
    
    
    private init(){}
    
    private var apiURL = "https://randomuser.me/"   //api/"
    
    func queryUser(completion:@escaping(_ Data:Any?,_ respError: Error?)->())->(){
        let url = apiURL + "api/"
        let parameters:Parameters? = nil
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: nil).responseJSON { response in
            switch(response.result){
            case .success(_):
                completion(response.data,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }
    }

}
