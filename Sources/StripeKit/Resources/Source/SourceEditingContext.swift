//
//  SourceEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct SourceEditingContext : Encodable {
    
    public var mandate : Mandate? = nil
    
    public var metadata : Metadata? = nil
    
    public struct Owner : Codable {
        public var address : Address? = nil
        public var email : String? = nil
        public var name : String? = nil
        public var phone : String? = nil
    }
    public var owner : Owner? = nil
    
}

extension SourceEditingContext : _EditingContext {
    
    public typealias Root = Source
    
}

extension SourceEditingContext : MetadataContainer {}
extension SourceEditingContext : Resource {}

