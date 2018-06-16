//
//  Subscription+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Subscription {
    
    public static func create(customer : String,
                              items : [SubscriptionItemCreationContext],
                              applicationFeePercent : Double? = nil,
                              billing : Subscription.Billing? = nil,
                              billingCycleAnchor : Date? = nil,
                              coupon : Coupon? = nil,
                              daysUntilDue : Int? = nil,
                              metadata : Metadata? = nil,
                              prorate : Bool? = nil,
//                              var source : ,
                              taxPercent : Double? = nil,
                              trialEnd : Date? = nil,
                              trialFromPlan : Bool? = nil,
                              trialPeriodDays : Int? = nil) throws -> Subscription? {
        
        var context = _SubscriptionCreationContext(customer: customer, items: items)
        context.applicationFeePercent = applicationFeePercent
        context.billing = billing
        context.billingCycleAnchor = billingCycleAnchor
        context.coupon = coupon
        context.daysUntilDue = daysUntilDue
        context.metadata = metadata
        context.prorate = prorate
        context.taxPercent = taxPercent
        context.trialEnd = trialEnd
        context.trialFromPlan = trialFromPlan
        context.trialPeriodDays = trialPeriodDays
        
        return try Stripe.default.create(context)
        
    }
    
}
