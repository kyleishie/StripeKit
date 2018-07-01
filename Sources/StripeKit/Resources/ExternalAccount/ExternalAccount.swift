//
//  ExternalAccount.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct ExternalAccount : Decodable {
    public let id : String
    public let account : String
    public let accountHolderName : String
    public let accountHolderType : Account.AccountType
    public let bankName : String?
    public let country : String
    public let currency : Currency?
    public let customer : String
    public let defaultForCurrency : Bool
    public let fingerprint : String
    public let last4 : String?
    public let metadata : Metadata
    public let routingNumber : String?
    
    public enum Status : String, Codable {
        case new
        case validated
        case verified
        case verficationFailed = "verification_failed"
        case errored
    }
    public let status : Status
}

extension ExternalAccount : Resource {}
extension ExternalAccount : MetadataContainer {}
extension ExternalAccount : Creatable {}
extension ExternalAccount : Retrievable {}
extension ExternalAccount : Updatable {}
extension ExternalAccount : Deleteable {}
extension ExternalAccount : Listable {}
