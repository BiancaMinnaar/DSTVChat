//
//  FriendResult.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class FriendResult: NSObject {
    var FirstName: String?
    var LastName: String?
    var Alias: String?
    var DateOfBirth: String?
    var ImageURL: String?
    var Status: String?
    var LastSeen: String?
    
    init(withJSONData data:AnyObject) {
        FirstName = data["firstName"] as AnyObject? as? String
        LastName = data["lastName"] as AnyObject? as? String
        Alias = data["alias"] as AnyObject? as? String
        DateOfBirth = data["dateOfBirth"] as AnyObject? as? String
        ImageURL = data["imageURL"] as AnyObject? as? String
        Status = data["status"] as AnyObject? as? String
        LastSeen = data["lastSeen"] as AnyObject? as? String
    }
}
