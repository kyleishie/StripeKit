//
//  URLSessionConfiguration+Stripe.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public extension URLSessionConfiguration {
    
    public static func stripeApi(withBearer token: String) -> URLSessionConfiguration {
        let sessionConfig = URLSessionConfiguration.ephemeral
        sessionConfig.allowsCellularAccess = true
        
        sessionConfig.httpAdditionalHeaders = [
            "Content-Type" : "application/x-www-form-urlencoded",
            "Accept" : "application/json",
            "Authorization" : "Bearer " + token
        ]
        
        sessionConfig.httpCookieAcceptPolicy = .never
        sessionConfig.httpShouldSetCookies = false
        
        return sessionConfig
    }
    
}
