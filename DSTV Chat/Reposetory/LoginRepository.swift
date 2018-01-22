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
    
    func Login(username: String, password: String, completion: @escaping (UserLoginResult?) -> Void) {
        do {
                try completion(_Service.Login(username: username, password: password))
        }
        catch ErrorModel.NetworkError(let errorMesasage){
            ErrorMessage = errorMesasage
        }
        catch{
            ErrorMessage = "General Error. Please debug"
        }
    }
}
