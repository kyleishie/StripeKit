//
//  Plan.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Plan : Decodable {
    
    public let id : String
    
    public enum AggregationStrategy : String, Codable {
        case sum
        case lastDuringPeriod = "last_during_period"
        case lastEver = "last_ever"
        case max
    }
    public let aggregateUsage : AggregationStrategy?
    
    public let amount : Int
    
    public enum BillingScheme : String, Codable {
        case perUnit = "per_unit"
        case teired
    }
    public let billingScheme : BillingScheme
    
    public let created : Date
    public let currency : Currency?
    
    public enum BillingInterval : String, Codable {
        case day
        case week
        case month
        case year
    }
    public let interval : BillingInterval
    
    public let intervalCount : Int
    public let livemode : Bool
    public let metadata : Metadata?
    public let nickname : String?
    public let product : String?
    
    public struct Tier : Codable, Resource {
        public let amount : Int
        public let upTo : Int
    }
    public let tiers : List<Tier>?
    
    public enum TierMode : String, Codable {
        case graduated
        case volume
    }
    public let tiersMode : TierMode?
    
    public struct UsageTransform : Codable {
        public let divideBy : Int
        
        public enum RoundingOption : String, Codable {
            case up
            case down
        }
        public let round : RoundingOption
    }
    public let transformUsage : UsageTransform?
    
    public let trialPeriodDays : Int?
    
    public enum UsageType : String, Codable {
        case metered
        case licensed
    }
    public let usageType : UsageType
    
}



extension Plan : Identifiable {}
extension Plan : MetadataContainer {}
extension Plan : Creatable {}
extension Plan : Retrievable {}
extension Plan : Updatable {}
extension Plan : Deleteable {}
extension Plan : Listable {}

extension Plan : Resource {}
