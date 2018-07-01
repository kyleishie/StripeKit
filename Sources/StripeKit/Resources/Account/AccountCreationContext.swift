//
//  AccountCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct AccountCreationContext : Encodable {
    
    public var country : String? = nil
    public var email : String? = nil
    public var type : Account.AccountType
    
    public init(type: Account.AccountType, email: String?, country: String? = nil) {
        if type == .standard {
            assert(email != nil, "Email is required when creating a standard account.")
        }
        
        self.type = type
        self.email = email
        self.country = country
    }
    
}

extension AccountCreationContext : _CreationContext {
    
    public typealias Root = Account
    
}
extension AccountCreationContext : MetadataContainer {}
extension AccountCreationContext : Resource {}
