//
//  List.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct List<T : Resource & Decodable> : Retrievable, Decodable {
    
    public let url : String
    public let hasMore : Bool
    public let data : [T]?
    
}

extension List : Resource {
    
    public static var path : String {
        return T.path
    }
    
}

extension List where T : Resource & Listable & Decodable {
    
    public static func retrieve(createdAfter: Date? = nil,
                                createdAtOrAfter: Date? = nil,
                                createdBefore: Date? = nil,
                                createdAtOrBefore: Date? = nil,
                                endingBefore: String? = nil,
                                startingAfter: String? = nil,
                                limit: Int? = nil) throws -> List<T>? {
        
        let query = [String : String](limit: limit,
                                      createdAfter: createdAfter,
                                      createdAtOrAfter: createdAtOrAfter,
                                      createdBefore: createdBefore,
                                      createdAtOrBefore: createdAtOrBefore,
                                      endingBefore: endingBefore,
                                      startingAfter: startingAfter)
        
        return try Stripe.default.retrieve(List<T>.self, query: query)
        
    }
    
}

extension Listable where Self : Resource & Decodable {
    
    public static func list(createdAfter: Date? = nil,
                            createdAtOrAfter: Date? = nil,
                            createdBefore: Date? = nil,
                            createdAtOrBefore: Date? = nil,
                            endingBefore: String? = nil,
                            startingAfter: String? = nil,
                            limit: Int? = nil) throws -> [Self]? {

        return try List<Self>.retrieve(createdAfter: createdAfter,
                                       createdAtOrAfter: createdAtOrAfter,
                                       createdBefore: createdBefore,
                                       createdAtOrBefore: createdAtOrBefore,
                                       endingBefore: endingBefore,
                                       startingAfter: startingAfter,
                                       limit: limit
            )?.data
        
    }
    
}
