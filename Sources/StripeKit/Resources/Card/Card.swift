//
//  Card.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct Card : Decodable {
    
    public let id : String
    public let customer : String
    public let expMonth : Int
    public let expYear : Int
    public let last4 : String
    
}
