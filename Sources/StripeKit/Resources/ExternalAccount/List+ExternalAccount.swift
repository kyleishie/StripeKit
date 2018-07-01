//
//  List+ExternalAccount.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension List where T == ExternalAccount {
    
    public var externalAccounts : [T]? {
        return data
    }
    
    public static func retrieve(endingBefore: String? = nil,
                                startingAfter: String? = nil,
                                limit: Int? = nil) throws -> List<ExternalAccount>? {
        
        let query = [String : String](limit: limit,
                                      createdAfter: nil,
                                      createdAtOrAfter: nil,
                                      createdBefore: nil,
                                      createdAtOrBefore: nil,
                                      endingBefore: endingBefore,
                                      startingAfter: startingAfter)
        
        return try Stripe.default.retrieve(List<ExternalAccount>.self, query: query)
        
    }


}
