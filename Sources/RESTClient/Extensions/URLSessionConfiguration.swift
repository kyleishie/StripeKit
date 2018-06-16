//
//  URLSessionConfiguration.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//



import Foundation

public extension URLSessionConfiguration {
    
    public static var restJSONAPI : URLSessionConfiguration {
        
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.allowsCellularAccess = true
        sessionConfig.httpAdditionalHeaders = [
            "Content-Type" : "application/json",
            "Accept" : "application/json"
        ]
        sessionConfig.httpCookieAcceptPolicy = .never
        sessionConfig.httpShouldSetCookies = false
        
        return sessionConfig
    }
    
    public static func authenticatedRESTJSONApi(withBearer token: String) -> URLSessionConfiguration {
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.allowsCellularAccess = true
        
        sessionConfig.httpAdditionalHeaders = [
            "Content-Type" : "application/json",
            "Accept" : "application/json",
            "Authorization" : "Bearer " + token
        ]
                
        sessionConfig.httpCookieAcceptPolicy = .never
        sessionConfig.httpShouldSetCookies = false
        
        return sessionConfig
    }
    
}
