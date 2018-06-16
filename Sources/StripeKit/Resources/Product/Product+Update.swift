//
//  Product+Update.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Product {
    
    public func update(active : Bool? = nil,
                       attributes : [String]? = nil,
                       caption : String? = nil,
                       deactivateOn : [String]? = nil,
                       description : String? = nil,
                       images : [URL]? = nil,
                       metadata : Metadata? = nil,
                       name : String? = nil,
                       packageDimensions : Product.PackageDimensionDescription? = nil,
                       shippable : Bool? = nil,
                       url : URL? = nil) throws -> Product? {
        
        var context = _ProductEditingContext()
        context.active = active
        context.attributes = attributes
        context.caption = caption
        context.deactivateOn = deactivateOn
        context.description = description
        context.images = images
        context.metadata = metadata
        context.name = name
        context.packageDimensions = packageDimensions
        context.shippable = shippable
        context.url = url
        
        return try Stripe.default.update(context, id: self.id)
    }
    
}
