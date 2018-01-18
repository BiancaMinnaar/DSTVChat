//
//  Networking.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class Networking: NSObject {
    
    class func LoginUser(withUserName:String?, password: String?, completion: @escaping (UserLoginResult) -> Void) -> Void {
        let parameters: Parameters = ["username": withUserName!, "password": password!]
        
        request("http://mobileexam.dstv.com/login", method:.post, parameters: parameters, encoding: JSONEncoding.default)
        .responseJSON { (response) in
            guard response.result.isSuccess else {
                print("Error while loging in: \(String(describing: response.result.error))")
                
                return
            }
        
            guard let userJSON = response.result.value as? [String: AnyObject] else{
                print("Malformed data received from Login service")
            
                return
            }
            
            let userDate = UserLoginResult(withJSONData: userJSON as AnyObject )
            
            return completion(userDate)
        }
        
    }
    
    class func GetFriendList(with uid:String?, name: String?, completion: @escaping ([FriendResult]) ->Void) -> Void {
        let urlString = "http://mobileexam.dstv.com/friends;uniqueID=" + uid! + ";name=" + name!
        request(urlString, method:.post, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            guard response.result.isSuccess else {
                print("Error while loging in: \(String(describing: response.result.error))")
                
                return
            }
            
            guard let friendsJSON = response.result.value as? [String: AnyObject],
            let rows = friendsJSON["friends"] as? [[String: AnyObject]] else{
                print("Malformed data received from Friends service")
                
                return
            }
            
            var friends = [FriendResult]()
            for friendDict in rows {
                friends.append(FriendResult(withJSONData: friendDict as AnyObject))
            }
            completion(friends)
        
        }

    }

}
