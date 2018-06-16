//
//  Source+Attach.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension Customer {
    
    public func attachSource(_ source: String) throws -> Source? {
        
        var request = URLRequest(Stripe.default.baseURL, pathItems: "customers", self.id, "sources")
        request.method = .post
        try Stripe.default.setJSONBody(["source" : source], for: &request)
        return try Stripe.default.performSyncDataTask(Source.self, with: request)
        
    }
    
    public func detachSource(_ source: String) throws -> Source? {
        
        var request = URLRequest(Stripe.default.baseURL, pathItems: "customers", self.id, "sources", source)
        request.method = .delete
        return try Stripe.default.performSyncDataTask(Source.self, with: request)
        
    }
    
}
