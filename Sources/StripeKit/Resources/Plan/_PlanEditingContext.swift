//
//  _PlanEditingContext.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

internal struct _PlanEditingContext : Encodable {
    
    public var product : String? = nil
    public var metadata : Metadata? = nil
    public var nickname : String? = nil
    public var trialPeriodDays : Bool? = nil
    
    public init() {}
    
}

extension _PlanEditingContext : _EditingContext {
    
    typealias Root = Plan
    
}

extension _PlanEditingContext : Resource {}
