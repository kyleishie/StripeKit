//
//  RESTClient+Sync.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//

import Foundation
import Dispatch

extension RESTClient {
    
    
    //MARK: List --- GET
    
    public func list<T : Resource & Listable & Decodable>(_ type: T.Type, query: [String : String]? = nil) throws -> [T]? {
        
        let request = URLRequest(baseURL, pathItems: T.path, query: query?.asQueryItems)
        return try performSyncDataTask([T].self, with: request)
        
    }
    
    
    //MARK: Retrieve --- GET
    
    public func retrieve<T : Resource & Retrievable & Decodable>(_ type: T.Type, id: String? = nil, query: [String : String]? = nil) throws -> T? {
        
        let request = URLRequest(baseURL, pathItems: T.path, id, query: query?.asQueryItems)
        return try performSyncDataTask(T.self, with: request)
        
    }
    
    
    //MARK: Create --- POST
    
    public func create<T : Resource & Creatable & Codable>(_ instance: T) throws -> T? {
        
        var request = URLRequest(baseURL, pathItems: T.path)
        request.method = .post
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(T.self, with: request)
        
    }
    
    public func create<T : Resource & Creatable & Encodable, R : Resource & Decodable>(_ instance: T) throws -> R? {
        
        var request = URLRequest(baseURL, pathItems: T.path)
        request.method = .post
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(R.self, with: request)
        
    }
    
    
    //MARK: Update --- PATCH
    
    public func update<T : Resource & Updatable & Codable>(_ instance: T, id: String? = nil) throws -> T? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .patch
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(T.self, with: request)
        
    }
    
    public func update<T : Resource & Updatable & Encodable, R : Resource & Decodable>(_ instance: T, id: String? = nil) throws -> R? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .patch
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(R.self, with: request)
        
    }
    
    
    //MARK: Replace --- PUT
    
    public func replace<T : Resource & Replaceable & Codable>(_ instance: T, id: String? = nil) throws -> T? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .put
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(T.self, with: request)
        
    }
    
    public func replace<T : Resource & Replaceable & Encodable, R : Resource & Decodable>(_ instance: T, id: String? = nil) throws -> R? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .put
        try setJSONBody(instance, for: &request)
        return try performSyncDataTask(R.self, with: request)
        
    }
    
    
    //MARK: Delete --- DELETE
    
    public func delete<T : Resource & Deleteable & Decodable>(_ type: T.Type, id: String? = nil) throws -> T? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .delete
        return try performSyncDataTask(T.self, with: request)

    }
    
    /// Use this method in cases where to response is not the same as the request.
    /// For example some APIs return just the id of the deleted resource.
    public func delete<T : Resource & Deleteable, R : Decodable>(_ type: T.Type, id: String? = nil, responseType: R.Type) throws -> R? {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .delete
        return try performSyncDataTask(R.self, with: request)
        
    }
    
}


