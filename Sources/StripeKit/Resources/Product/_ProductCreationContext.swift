//
//  _ProductCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _ProductCreationContext : Encodable {
    
    public var id : String? = nil
    public var name : String
    public var type : Product.ProductType
    public var attributes : [String]? = nil
    public var metadata : Metadata? = nil
    public var statementDescriptor : String? = nil
    public var unitLabel : String? = nil
    
    public init(name: String, type: Product.ProductType) {
        self.name = name
        self.type = type
    }
    
}

extension _ProductCreationContext : _CreationContext {
    
    typealias Root = Product
    
}
extension _ProductCreationContext : Creatable {}
extension _ProductCreationContext : MetadataContainer {}
extension _ProductCreationContext : Resource {}
