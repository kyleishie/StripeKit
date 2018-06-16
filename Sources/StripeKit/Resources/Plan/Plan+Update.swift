//
//  Plan+Update.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Plan {
    
    public func update(product : String? = nil,
                       metadata : Metadata? = nil,
                       nickname : String? = nil,
                       trialPeriodDays : Bool? = nil) throws -> Plan? {
        
        var context = _PlanEditingContext()
        context.product = product
        context.metadata = metadata
        context.nickname = nickname
        context.trialPeriodDays = trialPeriodDays
        
        return try Stripe.default.update(context)
    }
    
}
