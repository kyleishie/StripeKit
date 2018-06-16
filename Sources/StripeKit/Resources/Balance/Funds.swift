
//
//  Funds.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public struct Funds : Codable {
    
    public let currency : Currency
    public let amount : Cent
    public let sourceTypes: SourcesType
    
}
