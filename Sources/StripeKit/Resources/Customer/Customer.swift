//
//  Customer.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Customer : Decodable {
    
    public let id : String
    public let accountBalance : Cent
    public let businessVATId : String?
    public let created : Date
    public let currency : Currency?
    public let defaultSource : String?
    public let delinquent : Bool
    public let description : String?
    
    
    public let discount : Discount?
    
    public let email : String
    public let invoicePrefix : String
    public let livemode : Bool
    public let metadata : Metadata?
    public let shipping : Shipping?
    public let sources : List<Source>?
    public let subscriptions : List<Subscription>?
    
    public struct Source : Resource, Codable, MetadataContainer, Listable {
        
        public let number : String? = nil
        public let expMonth : String? = nil
        public let expYear : String? = nil
        public let cvc : String? = nil
        public let currency : Currency? = nil
        public let name : String? = nil
        public let addressLine1 : String? = nil
        public let addressLine2 : String? = nil
        public let addressCity : String? = nil
        public let addressState : String? = nil
        public let addressZip : String? = nil
        public let addresCountry : String? = nil
        public let metadata: Metadata? = nil
        public let defaultForCurrency: Currency? = nil
        
    }
    
}

extension Customer : Listable {}
extension Customer : Retrievable {}
extension Customer : Creatable {}
extension Customer : Updatable {}
extension Customer : Deleteable {}
extension Customer : Resource {}
extension Customer : Identifiable {}
extension Customer : MetadataContainer {}

public struct Shipping : Codable {
    
    public let address : Address
    public let name : String
    public let phone : String? = nil
    
}

public struct Address : Codable {
    
    public let line1 : String? = nil
    public let city : String? = nil
    public let country : String? = nil
    public let line2 : String? = nil
    public let postalCode : String? = nil
    public let state : String? = nil
    
}
