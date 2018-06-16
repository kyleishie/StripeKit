//
//  List+Plan.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension List where T == Plan {
    
    public var plans : [T]? {
        return data
    }
    
}

extension List where T == Plan {
    
    public static func retrieve(createdAfter: Date? = nil,
                                createdAtOrAfter: Date? = nil,
                                createdBefore: Date? = nil,
                                createdAtOrBefore: Date? = nil,
                                endingBefore: String? = nil,
                                startingAfter: String? = nil,
                                limit: Int? = nil,
                                product: String? = nil) throws -> List<Plan>? {
        
        var query = [String : String](limit: limit,
                                      createdAfter: createdAfter,
                                      createdAtOrAfter: createdAtOrAfter,
                                      createdBefore: createdBefore,
                                      createdAtOrBefore: createdAtOrBefore,
                                      endingBefore: endingBefore,
                                      startingAfter: startingAfter)
        
        if let product = product {
            query["product"] = product
        }
        
        return try Stripe.default.retrieve(List<Plan>.self, query: query)
        
    }
    
}
