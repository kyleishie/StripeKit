//
//  Subscription.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Subscription : Decodable {
    
    public let id : String
    public let applicationFeePercent : Double?
    
    public enum Billing : String, Codable {
        case chargeAutomatically = "charge_automatically"
        case sendInvoice = "send_invoice"
    }
    
    public let billing : Billing
    
    public let billingCycleAnchor : Date
    public let cancelAtPeriodEnd : Bool
    public let canceledAt : Date?
    public let created : Date
    public let currentPeriodEnd : Date
    public let currentPeriodStart : Date
    public let customer : String
    public let daysUntilDue : Int?
    public let discount : Discount?
    public let endedAt : Date?
    public let livemode : Bool
    public let metadata : Metadata?
    public let plan : Plan
    public let quantity : Int
    public let start : Date
    
    public enum Status : String, Decodable {
        case trialing
        case active
        case pastDue
        case canceled
        case unpaid
    }
    
    public let status : Status
    
    public let taxPercent : Double?
    public let trialEnd : Date?
    public let trialStart : Date?
    
//    public let items : List<>?
    
}

extension Subscription : Resource {}
extension Subscription : Identifiable {}
extension Subscription : MetadataContainer {}
extension Subscription : Creatable {}
extension Subscription : Updatable {}
extension Subscription : Retrievable {}
extension Subscription : Deleteable {}
extension Subscription : Listable {}
