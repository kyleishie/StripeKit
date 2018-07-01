//
//  Account+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Account {
    
    public static func create(type: Account.AccountType,
                              email: String?,
                              country: String? = nil) throws -> Account? {
        
        let context = AccountCreationContext(type: type,
                                             email: email,
                                             country: country)
        
        return try Stripe.default.create(context)
    }
    
}
