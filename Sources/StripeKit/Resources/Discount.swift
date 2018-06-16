//
//  Discount.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Discount : Codable, Deleteable {
    
    public let coupon : Coupon
    
    public let customer : String
    
    public let start : Date
    public let end : Date?
    
}
