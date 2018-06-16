//
//  Source.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Source : Decodable {
    
    public let id : String
    public let amount : Int? /// Single Use Only
    public let clientSecret : String?
    
    public struct Verification : Codable {
        public let attemptsRemaining : Int
        public let status : String
    }
    public let codeVerification : Verification
    
    public let created : Date
    public let currency : Currency?
    
    public enum Flow : String, Codable {
        case redirect
        case receiver
        case codeVerification = "code_verification"
        case none
    }
    public let flow : Flow?
    
    public let livemode : Bool
    public let metadata : Metadata
    
    
    public struct Owner : Codable {
        public let address : Address?
        public let email : String?
        public let phone : String?
        public let verifiedAddress : Address?
        public let verifiedEmail : String?
        public let verifiedName : String?
        public let verifiedPhone : String?
    }
    
    public let owner : Owner?
    
    public struct Receiver : Codable {
        public let address : String?
        public let amountCharged : Cent?
        public let amountReceived : Cent?
        public let amountRefunded : Cent?
    }
    
    public let receiver : Receiver?
    
    public struct Redirect : Codable {
        public let failureReason : String?
        public let returnUrl : URL?
        
        public enum Status : String, Codable {
            case pending
            case succeeded
            case notRequired = "not_required"
            case failed
        }
        public let status : Status?
        public let url : URL?
    }
    
    public let redirect : Redirect?
    
    public let statementDescriptor : String?
    
    public enum Status : String, Codable {
        case canceled
        case chargeable
        case consumed
        case failed
        case pending
    }
    public let status : Status?
    
    
    public enum SourceType : String, Codable {
        case achCreditTransfer = "ach_credit_transfer"
        case achDebit = "ach_debit"
        case alipay
        case bancontact
        case bitcoin
        case card
        case cardPresent = "card_present"
        case eps
        case giropay
        case ideal
        case multibanco
        case p24
        case sepaCreditTransfer = "sepa_credit_transfer"
        case sepaDebit = "sepa_debit"
        case sofort
        case threeDSource = "three_d_source"
    }
    
    public let type : SourceType
    
    public enum Usage : String, Codable {
        case reusable
        case singleUse = "single_use"
    }
    public let usage : Usage?
    
}

extension Source : Identifiable {}
extension Source : MetadataContainer {}

extension Source : Creatable {}
extension Source : Retrievable {}
extension Source : Updatable {}
extension Source : Deleteable {}

extension Source : Resource {}
