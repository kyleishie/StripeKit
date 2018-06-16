//
//  Customer+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Customer {
    
    public static func create(accountBalance : Cent? = nil,
                              businessVATId : String? = nil,
                              coupon : String? = nil,
                              defaultSource : String? = nil,
                              description : String? = nil,
                              email : String? = nil,
                              invoicePrefix : String? = nil,
                              metadata : Metadata? = nil,
                              shipping: Shipping? = nil,
                              source: Customer.Source? = nil) throws -> Customer? {
        
        var newCustomerInfo = _CustomerEditingContext()
        newCustomerInfo.accountBalance = accountBalance
        newCustomerInfo.businessVATId = businessVATId
        newCustomerInfo.coupon = coupon
        newCustomerInfo.defaultSource = defaultSource
        newCustomerInfo.description = description
        newCustomerInfo.email = email
        newCustomerInfo.invoicePrefix = invoicePrefix
        newCustomerInfo.metadata = metadata
        newCustomerInfo.shipping = shipping
        newCustomerInfo.source = source
        
        return try Stripe.default.create(newCustomerInfo)
        
    }
    
}
