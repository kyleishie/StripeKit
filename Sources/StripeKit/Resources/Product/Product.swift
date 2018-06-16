//
//  Product.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Product : Codable {
    
    public let id : String
    public let active : Bool?
    public let attributes : [String]
    public let caption : String?
    public let created : Date
    public let deactivateOn : [String]
    public let description : String?
    public let images : [URL]
    public let livemode : Bool
    
    public let name : String
    public let metadata : Metadata
    
    public struct PackageDimensionDescription : Codable {
        public let height : Double
        public let length : Double
        public let weight : Double
        public let width : Double
    }
    public let packageDimensions : PackageDimensionDescription?
    
    public let shippable : Bool?
    public let statementDescriptor : String?
    
    public enum ProductType : String, Codable {
        case good
        case service
    }
    public let type : ProductType
    
    public let unitLabel : String?
    public let updated : Date
    public let url : URL?
    
}

extension Product : Identifiable {}
extension Product : MetadataContainer {}
extension Product : Creatable {}
extension Product : Retrievable {}
extension Product : Updatable {}
extension Product : Listable {}
extension Product : Deleteable {}

extension Product : Resource {}
