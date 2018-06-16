//
//  List+Product.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension List where T == Product {
    
    public var products : [T]? {
        return data
    }
    
}

extension List where T == Product {
    
    public static func retrieve(active: Bool? = nil,
                                createdAfter: Date? = nil,
                                createdAtOrAfter: Date? = nil,
                                createdBefore: Date? = nil,
                                createdAtOrBefore: Date? = nil,
                                endingBefore: String? = nil,
                                ids: [String]? = nil,
                                limit: Int? = nil,
                                shippable: Bool? = nil,
                                startingAfter: String? = nil,
                                type: Product.ProductType? = nil,
                                url: URL? = nil) throws -> List<Product>? {
        
        var query = [String : String]()
        
        if let active = active {
            query["active"] = String(active)
        }
        
        if let createdAfter = createdAfter {
            query["created[gt]"] = "\(Int(createdAfter.timeIntervalSince1970))"
        }
        
        if let createdAtOrAfter = createdAtOrAfter {
            query["created[gte]"] = "\(Int(createdAtOrAfter.timeIntervalSince1970))"
        }
        
        if let createdBefore = createdBefore {
            query["created[lt]"] = "\(Int(createdBefore.timeIntervalSince1970))"
        }
        
        if let createdAtOrBefore = createdAtOrBefore {
            query["created[lte]"] = "\(Int(createdAtOrBefore.timeIntervalSince1970))"
        }
        
        if let ids = ids {
            ids.forEach({
                let index = ids.index(of: $0)
                query["ids[\(String(describing: index))]"] = $0
            })
        }
        
        if let endingBefore = endingBefore {
            query["ending_before"] = endingBefore
        }
        
        if let limit = limit {
            query["limit"] = "\(limit)"
        }
        
        if let startingAfter = startingAfter {
            query["starting_after"] = startingAfter
        }
        
        if let shippable = shippable {
            query["shippable"] = String(shippable)
        }
        
        if let type = type {
            query["type"] = type.rawValue
        }
        
        if let url = url {
            query["url"] = url.absoluteString
        }
        
        
        return try Stripe.default.retrieve(List<Product>.self, query: query)
        
    }
    
}
