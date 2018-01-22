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
    func Login(username:String, password:String, completion: @escaping (UserLoginResult) -> Void, failure: @escaping (String) -> Void) {
        let parameters: Parameters = ["username": username, "password": password]
        let networkURL = Constants.NETWORKURL + "login";
        
        request(networkURL, method:.post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    return failure("Error while loging in: \(String(describing: response.result.error))")
                }
                
                guard let userJSON = response.result.value as? [String: AnyObject] else{
                    return failure("Malformed data received from Login service")
                }
                
                return completion(UserLoginResult(withJSONData: userJSON as AnyObject ))
        }
    }
}
