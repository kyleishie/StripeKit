//
//  HTTPMethod.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//



import Foundation

public enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}


extension URLRequest {
    
    public var method : HTTPMethod? {
        get {
            guard let httpMethod = httpMethod else {
                return nil
            }
            return HTTPMethod(rawValue: httpMethod)
        }
        set {
            httpMethod = newValue?.rawValue ?? nil
        }
    }
    
}
