//
//  SourceCreationContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct SourceCreationContext : Encodable {
    
    public let type : Source.SourceType
    
    public var amount : Cent? = nil /// Single Use Only
    public var currency : Currency? = nil
    public var flow : Source.Flow? = nil
    
    
    
    
    public var mandate : Mandate? = nil
    
    public var metadata : Metadata? = nil
    
    public struct Owner : Codable {
        public var address : Address? = nil
        public var email : String? = nil
        public var name : String? = nil
        public var phone : String? = nil
    }
    public var owner : Owner? = nil
    
    public struct Receiver : Codable {
        public let refundAttributesMethod : String?
    }
    
    public var receiver : Receiver? = nil
    
    
    public struct Redirect : Codable {
        public let returnUrl : URL
    }
    
    public var redirect : Redirect? = nil
    
    public var stateDescriptor : String? = nil
    
    public var token : String? = nil
    
    public var usage : Source.Usage? = nil
}

extension SourceCreationContext : _CreationContext {
    
    public typealias Root = Source
    
}
extension SourceCreationContext : MetadataContainer {}
extension SourceCreationContext : Resource {}


