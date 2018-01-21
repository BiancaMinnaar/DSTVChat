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
    func Login(username: String, password: String) {
        
    }
    
    var _Service: LoginServiceProtocol
    
    init(masterRepository:MasterRepositoryProtocol, loginService:LoginServiceProtocol)
    {
        _Service = loginService
        super.init(masterReposetory: masterRepository)
    }
    
    
}
