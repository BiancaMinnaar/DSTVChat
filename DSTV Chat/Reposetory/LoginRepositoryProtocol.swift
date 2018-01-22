//
//  LoginRepositoryProtocol.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2018/01/21.
//  Copyright © 2018 BonsaiSoft. All rights reserved.
//

import Foundation

protocol LoginRepositoryProtocol
{
    func Login(username: String, password: String, completion: @escaping (UserLoginResult) -> Void, failure: @escaping (String) ->Void)
}
