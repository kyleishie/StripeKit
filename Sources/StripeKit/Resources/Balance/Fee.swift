//
//  Fee.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public struct Fee : Codable {
    
    public let amount: Cent
    public let application: String
    public let currency: Currency
    public let description: String?
    
    public enum FeeType: String, Codable {
        case application
        case stripe
        case tax
        
        enum CodingKeys : String, CodingKey {
            case application = "application_fee"
            case stripe = "stripe_fee"
            case tax
        }
    }
    
    public let type: FeeType
}
