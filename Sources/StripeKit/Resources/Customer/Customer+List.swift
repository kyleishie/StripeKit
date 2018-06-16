//
//  Customer+List.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension Customer {
    
    public static func list(email: String? = nil,
                            endingBefore: String? = nil,
                            limit: Int? = nil,
                            startingAfter: String? = nil,
                            createdAfter: Date? = nil,
                            createdAtOrAfter: Date? = nil,
                            createdBefore: Date? = nil,
                            createdAtOrBefore: Date? = nil) throws -> [Customer]? {
        
        return try List<Customer>.retrieve(email: email,
                                         endingBefore: endingBefore,
                                         limit: limit,
                                         startingAfter: startingAfter,
                                         createdAfter: createdAfter,
                                         createdAtOrAfter: createdAtOrAfter,
                                         createdBefore: createdBefore,
                                         createdAtOrBefore: createdAtOrBefore
            )?.customers
        
    }
    
    public static func findOne(email: String? = nil,
                               endingBefore: String? = nil,
                               startingAfter: String? = nil,
                               createdAfter: Date? = nil,
                               createdAtOrAfter: Date? = nil,
                               createdBefore: Date? = nil,
                               createdAtOrBefore: Date? = nil) throws -> Customer? {
        
        return try list(email: email,
                        endingBefore: endingBefore,
                        limit: 1,
                        startingAfter: startingAfter,
                        createdAfter: createdAfter,
                        createdAtOrAfter: createdAtOrAfter,
                        createdBefore: createdBefore,
                        createdAtOrBefore: createdAtOrBefore
            )?.first
        
    }
    
}
