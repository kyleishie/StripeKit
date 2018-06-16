//
//  Balance.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public typealias Cent = Int

public struct Balance : Decodable {
    
    public let available : [Funds]
    public let connectReserved : [Funds]?
    public let pending : [Funds]
    
    public let livemode : Bool
    
    public struct Transaction : Listable, Retrievable, Identifiable, Decodable {
        
        public let id : String
        public let amount : Cent
        public let availableOn : Date
        public let created : Date
        public let currency : Currency
        public let description : String
        public let exchangeRate : Double
        public let fee : Cent
        public let feeDetails : [Fee]
        public let net : Cent
        public let source : String?
        
        public enum Status : String, Codable {
            case available
            case pending
        }
        public let status : Status?
        
        public enum TransactionType : String, Decodable {
            case adjustment
            case applicationFee
            case applicationFeeRefund
            case charge
            case payment
            case paymentFailureRefund
            case paymentRefund
            case refund
            case transfer
            case transferRefund
            case payout
            case payoutCancel
            case payoutFailure
            case validation
            case stripeFee
        }
        
        public let type : TransactionType
        
    }
    
}

extension Balance : Retrievable {}

extension Balance : Resource {
    
    public static var path : String {
        return "balance"
    }
    
}

extension Balance.Transaction : Resource {
    
    public static var path : String {
        return "balance/history"
    }
    
}
