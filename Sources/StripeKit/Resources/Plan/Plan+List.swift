//
//  Plan+List.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Plan {
    
    public static func list(createdAfter: Date? = nil,
                            createdAtOrAfter: Date? = nil,
                            createdBefore: Date? = nil,
                            createdAtOrBefore: Date? = nil,
                            endingBefore: String? = nil,
                            startingAfter: String? = nil,
                            limit: Int? = nil,
                            product: String? = nil) throws -> [Plan]? {
        
        return try List<Plan>.retrieve(createdAfter: createdAfter,
                                       createdAtOrAfter: createdAtOrAfter,
                                       createdBefore: createdBefore,
                                       createdAtOrBefore: createdAtOrBefore,
                                       endingBefore: endingBefore,
                                       startingAfter: startingAfter,
                                       limit: limit,
                                       product: product
        )?.plans
        
    }
    
}
