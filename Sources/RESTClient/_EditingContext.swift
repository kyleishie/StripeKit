//
//  _EditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public protocol _EditingContext : _Context, Updatable { }

extension RESTClient {
    
    public func update<T : Resource & _EditingContext & Encodable>(_ instance: T, id: String? = nil) throws -> T.Root? where T.Root : Resource & Decodable {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .patch
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(T.Root.self, with: request)
        
    }
    
}
