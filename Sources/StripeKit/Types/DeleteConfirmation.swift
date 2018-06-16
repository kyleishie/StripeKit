//
//  DeleteConfirmation.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public struct DeleteConfirmation : Decodable {
    
    public let deleted : Bool
    public let id : String
    
}
