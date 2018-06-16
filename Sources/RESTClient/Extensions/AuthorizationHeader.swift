//
//  AuthorizationHeader.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public typealias AuthorizationHeader = String

private let headerKey: String = "Authorization"

extension URLRequest {
    
    var authorization: ContentType? {
        get {
            return value(forHTTPHeaderField: headerKey)
        }
        set {
            setValue(newValue, forHTTPHeaderField: headerKey)
        }
    }
    
}

extension HTTPURLResponse {
    
    var authorization: ContentType? {
        get {
            return allHeaderFields[headerKey] as? ContentType
        }
    }
    
}
