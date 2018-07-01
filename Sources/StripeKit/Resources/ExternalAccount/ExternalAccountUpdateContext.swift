//
//  ExternalAccountUpdateContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct ExternalAccountUpdateContext : Encodable {
    
    public let defaultForCurrency : Bool? = nil
    public let metadata: Metadata? = nil
    
}

extension ExternalAccountUpdateContext : _EditingContext {
    
    public typealias Root = ExternalAccount
    
}
extension ExternalAccountUpdateContext : MetadataContainer {}
extension ExternalAccountUpdateContext : Resource {}
