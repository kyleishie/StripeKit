//
//  Account.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Account : Decodable {
    
    public let id : String
    public let businessLogo : String?
    public let busniessName : String?
    public let businessUrl : String?
    public let chargesEnabled : Bool
    public let country : String
    public let created : Date
    public let debitNegativeBalances : Bool
    
    public struct ChargeFailureType : Codable {
        public let avsFailure : Bool
        public let cvcFailure : Bool
    }
    public let declineChargeOn : ChargeFailureType
    
    public let defaultCurrency : Currency
    public let detailsSubmitted : Bool
    public let displayName : String?
    public let email : String?
    
    public let externalAccounts : List<ExternalAccount>
    
    public struct DateOfBirth : Codable {
        public let date : Int?
        public let month : Int?
        public let year: Int?
    }
    
    public struct Verification : Codable {
        public enum DisabledReason : String, Codable {
            case rejectedFraud = "rejected.fraud"
            case rejectedTermsOfService = "rejected.terms_of_service"
            case rejectedListed = "rejected.listed"
            case rejectedOther = "rejected.other"
            case fieldsNeeded = "fields_needed"
            case listed
            case underReview = "under_review"
            case other
        }
        public let disabledReason : DisabledReason?
        
        public let dueBy : Date?
        public let fieldsNeeded : [String]?
    }
    public let verification : Verification
    
    public struct AdditionalOwner : Codable {
        public let address : Address
        public let dob : DateOfBirth
        public let firstName : String
        public let lastName : String
        public let maidenName : String
        public let personalIdNumberProvided : Bool
        
        public struct Verification : Codable {
            public let details : String?
            
            public enum DetailsCode : String, Codable {
                case scanCorrupt = "scan_corrupt"
                case scanNotReadable = "scan_not_readable"
                case scanFailedGreyscale = "scan_failed_greyscale"
                case scanNotUploaded = "scan_not_uploaded"
                case scanIdTypeNotSupported = "scan_id_type_not_supported"
                case scanIdCountryNotSupported = "scan_id_country_not_supported"
                case scanNameMismatch = "scan_name_mismatch"
                case scanFailedOther = "scan_failed_other"
                case failedKeyedIdentity = "failed_keyed_identity"
                case failedOther = "failed_other"
            }
            public let detailsCode : DetailsCode?
            public let document : String?
            public let documentBack : String?
            
            public enum Status : String, Codable {
                case unverified
                case pending
                case verified
            }
            public let status : Status
        }
        
        public let verification : Verification
    }
    
    public enum EntityType : String, Codable {
        case individual
        case company
    }
    
    public struct LegalEntity : Codable {
        public let additionalOwners : [AdditionalOwner]
        public let address : Address
        public let businessName : String?
        public let businessTaxIdProvided : Bool?
        public let dob : DateOfBirth?
        public let firstName : String?
        public let lastName : String?
        public let personalAddress : Address?
        public let personalIdNumberProvided : Bool?
        public let ssnLast4Provided : Bool?
        
        
        public let type : EntityType?
        public let verfication : Verification?
        
    }
    
    public let legalEntity : LegalEntity?
    public let metadata : Metadata?
    
    
    public struct PayoutSchedule : Codable {
        public let delayDays : Int
        
        public enum Interval : String, Codable {
            case manual
            case daily
            case weekly
            case monthly
        }
        public let interval : Interval
        
        /// Only valid when interval == .monthly
        public let monthlyAnchor : Int?
        
        /// Only valid when interval == .weekly
        public let weeklyAnchor : Int?
        
    }
    
    public let payoutSchedule : PayoutSchedule
    
    public let payoutStatementDescription : String?
    public let payoutsEnabled : Bool
    public let productDescription : String?
    public let statementDescriptor : String?
    public let supportEmail : String?
    public let supportPhone : String?
    public let timezone : String?
    
    public struct TermsOfServiceAcceptance : Codable {
        public let date : Date?
        public let ip : String?
        public let userAgenct : String?
    }
    public let tisAcceptance : TermsOfServiceAcceptance?
    
    public enum AccountType : String, Codable {
        case standard
        case express
        case custom
    }
    public let type : AccountType
    
    
    public struct Keys : Codable {
        public let secret : String?
        public let publishable : String?
    }
    
    public let keys : Keys?
}

extension Account : Resource {}
extension Account : MetadataContainer {}
extension Account : Creatable {}
extension Account : Retrievable {}
extension Account : Listable {}
extension Account : Updatable {}
extension Account : Deleteable {}

