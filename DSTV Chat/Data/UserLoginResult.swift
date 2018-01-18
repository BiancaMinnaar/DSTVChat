//
//  UserLoginResult.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class UserLoginResult: NSObject {
    var Result: Bool?
    var Guid: String?
    var FirstName: String?
    var LastName: String?
    
    init(withJSONData data:AnyObject) {
        Result = data["result"] as AnyObject? as? Bool
        Guid = data["guid"] as AnyObject? as? String
        FirstName = data["firstName"] as AnyObject? as? String
        LastName = data["lastName"] as AnyObject? as? String
    }

}
