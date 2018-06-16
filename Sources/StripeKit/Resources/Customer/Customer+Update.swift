//
//  Customer+Update.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Customer {
    
    public func update(accountBalance : Cent? = nil,
                       businessVATId : String? = nil,
                       coupon : String? = nil,
                       defaultSource : String? = nil,
                       description : String? = nil,
                       email : String? = nil,
                       invoicePrefix : String? = nil,
                       metadata : Metadata? = nil,
                       shipping: Shipping? = nil,
                       source: Customer.Source? = nil) throws -> Customer? {
        
        var update = _CustomerEditingContext()
        update.accountBalance = accountBalance
        update.businessVATId = businessVATId
        update.coupon = coupon
        update.defaultSource = defaultSource
        update.description = description
        update.email = email
        update.invoicePrefix = invoicePrefix
        update.metadata = metadata
        update.shipping = shipping
        update.source = source
        
        
        return try Stripe.default.update(update, id: self.id)
        
    }
    
}
