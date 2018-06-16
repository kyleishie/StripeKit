
//
//  Dictionary+URLQueryItem.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension Dictionary where Value == String, Key == String {
    
    public var asQueryItems : [URLQueryItem] {
        return self.map({ URLQueryItem(name: $0, value: $1) })
    }
    
}
