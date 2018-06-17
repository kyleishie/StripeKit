//
//  _SubscriptionCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _SubscriptionCreationContext : Encodable {
    
    public var customer : String
    public var items : [SubscriptionItemCreationContext]
    public var applicationFeePercent : Double? = nil
    public var billing : Subscription.Billing? = nil
    public var billingCycleAnchor : Date? = nil
    public var coupon : Coupon? = nil
    public var daysUntilDue : Int? = nil
    public var metadata : Metadata? = nil
    public var prorate : Bool? = nil
    public var source : String? = nil
    public var taxPercent : Double? = nil
    public var trialEnd : Date? = nil
    public var trialFromPlan : Bool? = nil
    public var trialPeriodDays : Int? = nil
    
    public init(customer: String, items: [SubscriptionItemCreationContext]) {
        self.customer = customer
        self.items = items
    }
    
}

extension _SubscriptionCreationContext : MetadataContainer {}
extension _SubscriptionCreationContext : _CreationContext {
    
    typealias Root = Subscription
    
}

extension _SubscriptionCreationContext : Resource {}

