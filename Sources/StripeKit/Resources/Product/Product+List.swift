//
//  Product+List.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Product {
    
    public static func list(active: Bool? = nil,
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
                            url: URL? = nil) throws -> [Product]? {
        
        return try List<Product>.retrieve(active: active,
                                          createdAfter: createdAfter,
                                          createdAtOrAfter: createdAtOrAfter,
                                          createdBefore: createdBefore,
                                          createdAtOrBefore: createdAtOrBefore,
                                          endingBefore: endingBefore,
                                          ids: ids,
                                          limit: limit,
                                          shippable: shippable,
                                          startingAfter: startingAfter,
                                          type: type,
                                          url: url
            )?.products
    }
    
}
