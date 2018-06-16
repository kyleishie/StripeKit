//
//  _ProductEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _ProductEditingContext : Encodable {
    
    public var active : Bool? = nil
    public var attributes : [String]? = nil
    public var caption : String? = nil
    public var deactivateOn : [String]? = nil
    public var description : String? = nil
    public var images : [URL]? = nil
    public var metadata : Metadata? = nil
    public var name : String? = nil
    public var packageDimensions : Product.PackageDimensionDescription? = nil
    public var shippable : Bool? = nil
    public var url : URL? = nil
    
    public init() {}
    
}

extension _ProductEditingContext : MetadataContainer {}
extension _ProductEditingContext : Resource {}

extension _ProductEditingContext : _EditingContext {
    
    typealias Root = Product
    
}
