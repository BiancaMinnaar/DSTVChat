//
//  ErrorModel.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2018/01/22.
//  Copyright © 2018 BonsaiSoft. All rights reserved.
//

import Foundation

enum ErrorModel: Error
{
    case NetworkError(errorMesasage:String)
    case LogicError
    case InputError(userErrorMessage:String)
}
