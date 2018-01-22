//
//  LoginRepository.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2018/01/21.
//  Copyright © 2018 BonsaiSoft. All rights reserved.
//

import Foundation

class LoginRepository : BaseRepository, LoginRepositoryProtocol
{
    var _Service: LoginServiceProtocol
    
    init(masterRepository:MasterRepositoryProtocol, loginService:LoginServiceProtocol)
    {
        _Service = loginService
        super.init(masterReposetory: masterRepository)
    }
    
    func Login(username: String, password: String, completion: @escaping (UserLoginResult) -> Void, failure: @escaping (String) ->Void) {
        _Service.Login(username: username, password: password, completion: completion, failure: failure)
    }
}
