//
//  ExternalAccount+List.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension ExternalAccount {
    
    public static func list(endingBefore: String? = nil,
                            startingAfter: String? = nil,
                            limit: Int? = nil) throws -> [ExternalAccount]? {
        
        return try List<ExternalAccount>.retrieve(endingBefore: endingBefore,
                                                  startingAfter: startingAfter,
                                                  limit: limit
        )?.externalAccounts
    }
}
