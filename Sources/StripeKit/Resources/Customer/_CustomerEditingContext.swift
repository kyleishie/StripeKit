//
//  _CustomerEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _CustomerEditingContext : Encodable {
    
    public var accountBalance : Cent? = nil
    public var businessVATId : String? = nil
    public var coupon : String? = nil
    public var defaultSource : String? = nil
    public var description : String? = nil
    public var email : String? = nil
    public var invoicePrefix : String? = nil
    public var metadata : Metadata? = nil

    public var shipping : Shipping? = nil

    public var source : Customer.Source? = nil
    
    public init() {}
    
}

extension _CustomerEditingContext : Resource {}
extension _CustomerEditingContext : MetadataContainer {}
extension _CustomerEditingContext : _EditingContext, _CreationContext {
    typealias Root = Customer
}


