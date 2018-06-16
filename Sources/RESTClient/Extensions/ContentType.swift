//
//  ContentType.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public typealias ContentType = String

private let headerKey = "Content-Type"

extension URLRequest {
    
    var contentType: ContentType? {
        get {
            return value(forHTTPHeaderField: headerKey)
        }
        set {
            setValue(newValue, forHTTPHeaderField: headerKey)
        }
    }
    
}

extension HTTPURLResponse {
    
    var contentType: ContentType? {
        get {
            return allHeaderFields[headerKey] as? ContentType
        }
    }
    
}



