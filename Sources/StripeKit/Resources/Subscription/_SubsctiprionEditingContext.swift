//
//  _SubsctiprionEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _SubsctiprionEditingContext : Encodable {
    
    public var applicationFeePercent : Double? = nil
    public var billing : Subscription.Billing? = nil
    public var billingCycleAnchor : Date? = nil
    public var cancelAtPeriodEnd : Bool? = nil /// Update Only
    public var coupon : Coupon? = nil
    public let daysUntilDue : Int? = nil
    public let metadata : Metadata? = nil
    public var prorate : Bool? = nil
    public var prorationDate : Date? = nil /// Update Only
    public var source : [String : String]? = nil
    public var taxPercent : Double? = nil
    public var trialEnd : Date? = nil
    public var trialFromPlan : Bool? = nil
    public var trialPeriodDays : Int? = nil
    
}

extension _SubsctiprionEditingContext : _EditingContext {
    
    typealias Root = Subscription
    
}

extension _SubsctiprionEditingContext : Resource {}
extension _SubsctiprionEditingContext : MetadataContainer {}
extension _SubsctiprionEditingContext : Creatable {}
extension _SubsctiprionEditingContext : Updatable {}
