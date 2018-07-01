//
//  ExternalAccountCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct ExternalAccountCreationContext : Encodable {
    
    public enum Definition : Encodable {
        case token(String)
        case dictionary(country: String,
            currency: Currency,
            accountHolderName: String,
            accountHolderType: Account.LegalEntity,
            routingNumber: String,
            accountNumber: String)
        
        enum CodingKeys : String, CodingKey {
            case object
            case country
            case currency
            case accountHolderName = "account_holder_name"
            case accountHolderType = "account_holder_type"
            case routingNumber = "routing_number"
            case accountNumber = "account_number"
        }
        
        public func encode(to encoder: Encoder) throws {
            
            
            switch self {
            case .token(let tokenString):
                var container = encoder.singleValueContainer()
                try container.encode(tokenString)
                
            case let .dictionary(country, currency, accountHolderName, accountHolderType, routingNumber, accountNumber):
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode("bank_account", forKey: .object)
                try container.encode(country, forKey: .country)
                try container.encode(currency, forKey: .currency)
                try container.encode(accountHolderName, forKey: .accountHolderName)
                try container.encode(accountHolderType, forKey: .accountHolderType)
                try container.encode(routingNumber, forKey: .routingNumber)
                try container.encode(accountNumber, forKey: .accountNumber)
            }
            
        }
    }
    
    public let externalAccount : Definition
    public let defaultForCurrency : Bool? = nil
    public let metadata: Metadata? = nil
    
}

extension ExternalAccountCreationContext : _CreationContext {
    
    public typealias Root = ExternalAccount
    
}
extension ExternalAccountCreationContext : MetadataContainer {}
extension ExternalAccountCreationContext : Resource {}
