//
//  URLRequest+CodableBody.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//



import Foundation

extension URLRequest {
    
    mutating func setJSONBody<T : Encodable>(_ body: T, with encoder: CodableEncoder = JSONEncoder()) throws {
        httpBody = try encoder.encode(body)
    }
    
}
