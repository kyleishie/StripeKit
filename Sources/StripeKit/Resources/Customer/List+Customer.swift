//
//  List+Customer.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension List where T == Customer {
    
    /// Convenience to improve readability of user code.
    public var customers : [Customer]? {
        return data
    }
    
}

extension List where T == Customer {
    
    public static func retrieve(email: String? = nil,
                                endingBefore: String? = nil,
                                limit: Int? = nil,
                                startingAfter: String? = nil,
                                createdAfter: Date? = nil,
                                createdAtOrAfter: Date? = nil,
                                createdBefore: Date? = nil,
                                createdAtOrBefore: Date? = nil) throws -> List<Customer>? {
        
        
        
        var query = [String : String]()
        
        if let email = email {
            query["email"] = email
        }
        
        if let endingBefore = endingBefore {
            query["ending_before"] = endingBefore
        }
        
        if let limit = limit {
            query["limit"] = "\(limit)"
        }
        
        if let startingAfter = startingAfter {
            query["starting_after"] = startingAfter
        }
        
        if let createdAfter = createdAfter {
            query["created[gt]"] = "\(Int(createdAfter.timeIntervalSince1970))"
        }
        
        if let createdAtOrAfter = createdAtOrAfter {
            query["created[gte]"] = "\(Int(createdAtOrAfter.timeIntervalSince1970))"
        }
        
        if let createdBefore = createdBefore {
            query["created[lt]"] = "\(Int(createdBefore.timeIntervalSince1970))"
        }
        
        if let createdAtOrBefore = createdAtOrBefore {
            query["created[lte]"] = "\(Int(createdAtOrBefore.timeIntervalSince1970))"
        }
        
        return try Stripe.default.retrieve(List<Customer>.self, query: query)
        
    }
    
}
