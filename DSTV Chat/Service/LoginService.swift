//
//  LoginService.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2018/01/22.
//  Copyright © 2018 BonsaiSoft. All rights reserved.
//

import Foundation
import Alamofire

class LoginService: LoginServiceProtocol
{
    func Login(username: String, password: String) throws -> UserLoginResult? {
        let parameters: Parameters = ["username": username, "password": password]
        let networkURL = Constants.NETWORKURL + "login";
        var userData:UserLoginResult?
        var errorMessage:String?
        
        request(networkURL, method:.post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    errorMessage = "Error while loging in: \(String(describing: response.result.error))"
                    return
                }
                
                guard let userJSON = response.result.value as? [String: AnyObject] else{
                    errorMessage = "Malformed data received from Login service"
                    
                    return
                }
                
                userData = UserLoginResult(withJSONData: userJSON as AnyObject )
        }
        if errorMessage != nil{
            throw ErrorModel.NetworkError(errorMesasage: errorMessage!)
        }
        
        return userData
    }
}
