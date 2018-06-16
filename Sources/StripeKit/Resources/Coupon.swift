//
//  Coupon.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Coupon : Codable {
    
    public enum Duration : String, Codable {
        case forever
        case once
        case repeating
    }
    public let duration : Duration
    
    public let id : String?
    public let name : String?
    public let created : Date?
    
    /// Mutually Exclusive with percentOff
    public let amountOff : Int?
    
    /// Require when using amountOff but not percentOff
    public let currency : Currency?
    
    /// Mutually Exclusive with amountOff
    public let percentOff : Int?
    
    
    /// nil when duration is .forever or .once
    public let durationInMonths : Int?
    
    public let livemode : Bool?
    
    public let maxRedemptions : Int?
    
    
    
    public let metadata : Metadata?
    
    
    
    public let redeemBy : Date?
    
    public let timesRedeemed : Int?
    
    public let valid : Bool?
    
    public init(duration: Duration, id: String?, name: String?, percentOff: Int, durationInMonths: Int? = nil, maxRedemptions: Int? = nil, metadata: Metadata? = nil, redeemBy: Date? = nil) {
        
        if duration == .repeating {
            guard let months = durationInMonths, months > 0  else {
                fatalError("DurationInMonths must be a positive integer when duration is set to .repeating")
            }
        }
        
        self.duration = duration
        self.id = id
        self.name = name
        self.percentOff = percentOff
        self.amountOff = nil
        self.currency = nil
        self.durationInMonths = nil
        self.maxRedemptions = maxRedemptions
        self.metadata = metadata
        self.redeemBy = redeemBy
        
        self.created = nil
        self.livemode = nil
        self.timesRedeemed = nil
        self.valid = nil
    }
    
    public init(duration: Duration, id: String?, name: String?, amountOff: Int, currency: Currency, durationInMonths: Int? = nil, maxRedemptions: Int? = nil, metadata: Metadata? = nil, redeemBy: Date? = nil) {
        
        if duration == .repeating {
            guard let months = durationInMonths, months > 0  else {
                fatalError("DurationInMonths must be a positive integer when duration is set to .repeating")
            }
        }
        
        self.duration = duration
        self.id = id
        self.name = name
        self.amountOff = amountOff
        self.currency = currency
        self.percentOff = nil
        self.durationInMonths = durationInMonths
        self.maxRedemptions = maxRedemptions
        self.metadata = metadata
        self.redeemBy = redeemBy
        
        self.created = nil
        self.livemode = nil
        self.timesRedeemed = nil
        self.valid = nil
    }
    
}

extension Coupon : MetadataContainer {}
extension Coupon : Creatable {}
extension Coupon : Retrievable {}
extension Coupon : Listable {}
extension Coupon : Updatable {}
extension Coupon : Deleteable {}

extension Coupon : Resource {
    
    public static var path: String {
        return "coupons"
    }
    
}
