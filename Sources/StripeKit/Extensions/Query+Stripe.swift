//
//  Query+Stripe.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension Dictionary where Key == String, Value == String {
    
    init(limit: Int? = nil,
         createdAfter: Date? = nil,
         createdAtOrAfter: Date? = nil,
         createdBefore: Date? = nil,
         createdAtOrBefore: Date? = nil,
         endingBefore: String? = nil,
         startingAfter: String? = nil) {
        
        var query = [String : String]()
        
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
        
        if let endingBefore = endingBefore {
            query["ending_before"] = endingBefore
        }
        
        if let limit = limit {
            query["limit"] = "\(limit)"
        }
        
        if let startingAfter = startingAfter {
            query["starting_after"] = startingAfter
        }
        
        self = query
    }
    
}
