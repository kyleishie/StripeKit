//
//  _PlanCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _PlanCreationContext : Encodable {
    
    public var id : String? = nil
    public var currency : Currency
    public var interval : Plan.BillingInterval
    public var amount : Cent
    
    public var product : String? = nil
//    public var newProduct : _ProductCreationContext? = nil
    public var aggregateUsage : Plan.AggregationStrategy? = nil
    
    public var billingScheme : Plan.BillingScheme? = nil
    public var intervalCount : Int? = nil
    public var metadata : Metadata? = nil
    public var nickname : String? = nil
    public var tiers : [Plan.Tier]? = nil
    public var tiersMode : Plan.TierMode? = nil
    public var transformUsage : Plan.UsageTransform? = nil
    public var trialPeriodDays : Bool? = nil
    public var usageType : Plan.UsageType? = nil

    
    public init(amount : Cent, currency : Currency = .usd, interval : Plan.BillingInterval) {
        self.amount = amount
        self.currency = currency
        self.interval = interval
    }
    
}

extension _PlanCreationContext : _CreationContext {
    
    public typealias Root = Plan
    
}

extension _PlanCreationContext : Resource {}
