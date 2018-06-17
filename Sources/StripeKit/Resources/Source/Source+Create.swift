//
//  Source+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Source {
    
    /// Create with token
    public static func create(type: Source.SourceType,
                              amount: Cent? = nil,
                              currency: Currency? = nil,
                              flow: Source.Flow? = nil,
                              mandate: Mandate? = nil,
                              metadata: Metadata? = nil,
                              owner: SourceCreationContext.Owner? = nil,
                              receiver: SourceCreationContext.Receiver? = nil,
                              redirect: SourceCreationContext.Redirect? = nil,
                              stateDescriptor: String? = nil,
                              token: String? = nil,
                              usage: Source.Usage? = nil) throws -> Source? {
        
        let context = SourceCreationContext(type: type,
                                            amount: amount,
                                            currency: currency,
                                            flow: flow,
                                            mandate: mandate,
                                            metadata: metadata,
                                            owner: owner,
                                            receiver: receiver,
                                            redirect: redirect,
                                            stateDescriptor: stateDescriptor,
                                            token: token,
                                            usage: usage)
        
        return try Stripe.default.create(context)
    }
    
}
