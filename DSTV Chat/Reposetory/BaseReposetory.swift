//
//  BaseReposetory.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2018/01/21.
//  Copyright © 2018 BonsaiSoft. All rights reserved.
//

import Foundation

class BaseRepository
{
    var _MasterReposetory: MasterRepositoryProtocol
    var HasError: Bool
    var ErrorMessage: String?
    
    init(masterReposetory:MasterRepositoryProtocol)
    {
        _MasterReposetory = masterReposetory
        HasError = false;
    }
}
