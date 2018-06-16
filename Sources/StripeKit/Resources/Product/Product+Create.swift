//
//  Product+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Product {
    
    public static func create(name: String,
                              type : Product.ProductType,
                              id: String? = nil,
                              attributes : [String]? = nil,
                              metadata : Metadata? = nil,
                              statementDescriptor : String? = nil,
                              unitLabel : String? = nil) throws -> Product? {
        
        var context = _ProductCreationContext(name: name, type: type)
        context.id = id
        context.attributes = attributes
        context.metadata = metadata
        context.statementDescriptor = statementDescriptor
        context.unitLabel = unitLabel
        
        return try Stripe.default.create(context)
    }
    
}
