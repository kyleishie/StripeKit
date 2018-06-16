//
//  SubscriptionItem.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct SubscriptionItem : Decodable {
    
    public let id : String
    public let created : Date
    public let metaddata : Metadata
    public let plan : Plan
    public let quantity : Int
    public let subscription : String?
    
}

extension SubscriptionItem : Identifiable {}
extension SubscriptionItem : MetadataContainer {}
extension SubscriptionItem : Resource {
    
    public static var path : String {
        return " subscription_items"
    }
    
}
