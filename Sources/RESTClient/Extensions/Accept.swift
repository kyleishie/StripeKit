//
//  Accept.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//

import Foundation

public typealias Accept = String

private let headerKey = "Accept"

extension URLRequest {
    
    var accept: Accept? {
        get {
            return value(forHTTPHeaderField: headerKey)
        }
        set {
            setValue(newValue, forHTTPHeaderField: headerKey)
        }
    }
    
}

extension HTTPURLResponse {
    
    var accept: Accept? {
        get {
            return allHeaderFields[headerKey] as? Accept
        }
    }
    
}
