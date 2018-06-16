//
//  RESTClient+Async.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//

import Foundation

extension RESTClient {
    
    //MARK: List --- GET
    
    public func list<T : Resource & Listable & Decodable>(_ type: T.Type, query: [String : String]? = nil, completionHandler: @escaping ((Result<[T], Error>) -> Void)) -> URLSessionDataTask {
        
        let request = URLRequest(baseURL, pathItems: T.path, query: query?.asQueryItems)
        return dataTask([T].self, with: request, completionHandler: completionHandler)
        
    }
    
    
    //MARK: Retrieve --- GET
    
    public func retrieve<T : Resource & Retrievable & Decodable>(_ type: T.Type, id: String? = nil, query: [String : String]? = nil, completionHandler: @escaping ((Result<T, Error>) -> Void)) -> URLSessionDataTask {

        let request = URLRequest(baseURL, pathItems: T.path, id, query: query?.asQueryItems)
        return dataTask(T.self, with: request, completionHandler: completionHandler)
        
    }
    
    
    //MARK: Create --- POST
    
    public func create<T : Resource & Creatable & Codable>(_ instance: T, completionHandler: @escaping ((Result<T, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(url: baseURL.appendingPathComponent(T.path))
        request.method = .post
        try setJSONBody(instance, for: &request)
        return dataTask(T.self, with: request, completionHandler: completionHandler)
        
    }
    
    public func create<T : Resource & Creatable & Encodable, R : Resource & Decodable>(_ instance: T, responseType: R.Type, completionHandler: @escaping ((Result<R, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(url: baseURL.appendingPathComponent(T.path))
        request.method = .post
        try setJSONBody(instance, for: &request)
        return dataTask(R.self, with: request, completionHandler: completionHandler)
        
    }
    
    
    //MARK: Update --- PATCH
    
    public func update<T : Resource & Updatable & Codable>(_ instance: T, id: String? = nil, completionHandler: @escaping ((Result<T, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .patch
        try setJSONBody(instance, for: &request)
        return dataTask(T.self, with: request, completionHandler: completionHandler)
        
    }
    
    public func update<T : Resource & Updatable & Encodable, R : Resource & Decodable>(_ instance: T, id: String? = nil, responseType: R.Type, completionHandler: @escaping ((Result<R, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .patch
        try setJSONBody(instance, for: &request)
        return dataTask(R.self, with: request, completionHandler: completionHandler)
        
    }
    
    
    //MARK: Replace --- PUT
    
    public func replace<T : Resource & Replaceable & Codable>(_ instance: T, id: String? = nil, completionHandler: @escaping ((Result<T, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .put
        try setJSONBody(instance, for: &request)
        return dataTask(T.self, with: request, completionHandler: completionHandler)
        
    }
    
    public func replace<T : Resource & Replaceable & Encodable, R : Resource & Decodable>(_ instance: T, id: String? = nil, responseType: R.Type, completionHandler: @escaping ((Result<R, Error>) -> Void)) throws -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .put
        try setJSONBody(instance, for: &request)
        return dataTask(R.self, with: request, completionHandler: completionHandler)
        
    }
    
    
    //MARK: Delete --- DELETE
    
    public func delete<T : Resource & Deleteable & Decodable>(_ type: T.Type, id: String? = nil, completionHandler: @escaping ((Error?) -> Void)) -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .delete
        let task = dataTask(T?.self, with: request) { result in
            if case let .failure(_, error) = result {
                completionHandler(error)
            }
            completionHandler(nil)
        }
        return task
        
    }
    
    /// Use this method in cases where to response is not the same as the request.
    /// For example some APIs return just the id of the deleted resource.
    public func delete<T : Resource & Deleteable, R : Decodable>(_ type: T.Type, id: String? = nil, responseType: R.Type, completionHandler: @escaping ((Result<R, Error>) -> Void)) -> URLSessionDataTask {
        
        var request = URLRequest(baseURL, pathItems: T.path, id)
        request.method = .delete
        return dataTask(R.self, with: request, completionHandler: completionHandler)
        
    }
    
}



