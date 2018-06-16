//
//  Metadata.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

//TODO: Figure out why Metadata cannot be used as type.
//TODO: Update FormURLEncoder to handle nested data.
//public protocol Metadata : Codable { }

public typealias Metadata = [String : String]

/// Stripe Objects that can contain the metadata field should conform to this.
public protocol MetadataContainer {
    
    var metadata : Metadata? { get }
    
}

extension MetadataContainer {
    
    public var metadata : Metadata? {
        return nil
    }
    
}
