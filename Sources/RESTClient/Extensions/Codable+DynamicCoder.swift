//
//  Codable+DynamicCoder.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

/**
 Provide a common interface for encoders.
 */
public protocol CodableEncoder {
    
    func encode<T>(_ value: T) throws -> Data where T : Encodable
    
}

/// The existing encoders provided by Foundation do not explicitly conforms to CodableEncoder,
/// but they do implement CodableEncoder's requirements.
extension JSONEncoder : CodableEncoder {}
extension PropertyListEncoder : CodableEncoder {}


/**
 Provide a common interface for decoders.
 */
public protocol CodableDecoder {
    
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    
}

/// The existing decoders provided by Foundation do not explicitly conforms to CodableDecoder,
/// but they do implement CodableDecoder's requirements.
extension JSONDecoder : CodableDecoder {}
extension PropertyListDecoder : CodableDecoder {}
