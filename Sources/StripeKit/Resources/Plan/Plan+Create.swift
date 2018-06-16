//
//  Plan+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Plan {
    
    public static func create(amount : Cent,
                              currency : Currency,
                              interval : Plan.BillingInterval,
                              productId : String,
//                              newProductName : String? = nil,
//                              newProductId : String? = nil,
//                              newProductMetadata : Metadata? = nil,
//                              newProductStatementDescriptor : String? = nil,
                              id: String? = nil,
                              aggregateUsage : Plan.AggregationStrategy? = nil,
                              billingScheme : Plan.BillingScheme? = nil,
                              intervalCount : Int? = nil,
                              metadata : Metadata? = nil,
                              nickname : String? = nil,
                              tiers : [Plan.Tier]? = nil,
                              tiersMode : Plan.TierMode? = nil,
                              transformUsage : Plan.UsageTransform? = nil,
                              trialPeriodDays : Bool? = nil,
                              usageType : Plan.UsageType? = nil) throws -> Plan? {
        
        var context = _PlanCreationContext(amount: amount, currency: currency, interval: interval)
        
//        guard productId != nil, newProductName == nil else {
//            fatalError("API Misuse.  productId and newProductName are mutaully exclusive.  See https://stripe.com/docs/api#create_plan for details.")
//        }
        
//        if let productId = productId {
            context.product = productId
//        } else {
//            guard let productName = newProductName else {
//                fatalError("API Miuse.  newProductName is required when no existing product id is provided.  See https://stripe.com/docs/api#create_plan for details.")
//            }
//
//            var newProductContext = _ProductCreationContext(name: productName, type: .service)
//            newProductContext.id = newProductId
//            newProductContext.metadata = newProductMetadata
//            newProductContext.statementDescriptor = newProductStatementDescriptor
//
//            context.newProduct = newProductContext
//        }
        
        context.id = id
        context.aggregateUsage = aggregateUsage
        context.amount = amount
        context.billingScheme = billingScheme
        context.intervalCount = intervalCount
        context.metadata = metadata
        context.nickname = nickname
        context.tiers = tiers
        context.tiersMode = tiersMode
        context.transformUsage = transformUsage
        context.trialPeriodDays = trialPeriodDays
        context.usageType = usageType
        
        return try Stripe.default.create(context)
        
    }
    
}
