//
//  SubscriptionItemEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct SubscriptionItemEditingContext : Encodable {
    
    public var metadata : Metadata? = nil
    public var plan : String? = nil
    public var prorate : Bool? = nil
    public var prorationDate : Date? = nil
    public var quantity : Int? = nil
    
}

extension SubscriptionItemEditingContext : Resource {}
extension SubscriptionItemEditingContext : MetadataContainer {}
extension SubscriptionItemEditingContext : _EditingContext {
    
    public typealias Root = SubscriptionItem
    
}
