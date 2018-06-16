//
//  SubscriptionItemCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct SubscriptionItemCreationContext : Encodable {
    
    public let plan : String
    public let subscription : String?
    public var metadata : Metadata? = nil
    public var prorate : Bool? = nil
    public var prorationDate : Date? = nil
    public var quantity : Int? = nil
    
    public init(plan: String, subscription: String) {
        self.plan = plan
        self.subscription = subscription
    }
    
    /// This init should only be used during subscription creation.
    public init(plan: String) {
        self.plan = plan
        self.subscription = nil
    }
    
}

extension SubscriptionItemCreationContext : Resource {}
extension SubscriptionItemCreationContext : MetadataContainer {}
extension SubscriptionItemCreationContext : _CreationContext {
    
    public typealias Root = SubscriptionItem
    
}
