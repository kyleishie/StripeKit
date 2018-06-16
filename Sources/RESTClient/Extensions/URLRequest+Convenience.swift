//
//  URLRequest+Convenience.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension URLRequest {
    
    public init(_ baseURL: URL, pathItems: String?..., query: [URLQueryItem]? = nil) {
        
        var url = baseURL
        pathItems.compactMap({ $0 }).forEach({ url.appendPathComponent($0) })
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = query
        
        self.init(url: urlComponents!.url!)
        
    }
    
}
