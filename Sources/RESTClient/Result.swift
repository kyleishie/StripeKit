//
//  Result.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public enum Result<T, Error> where Error : Swift.Error {
    case success(T)
    case failure(HTTPStatus, Error)
    case systemFailure(Swift.Error)
}

extension Result where T : ExpressibleByNilLiteral {
    
    public var successNoData : Result<T, Error> {
        return .success(nil)
    }
    
}
