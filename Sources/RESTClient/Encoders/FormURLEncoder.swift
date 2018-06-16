//
//  FormURLEncoder.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public struct FormURLEnoder : CodableEncoder {
    
    public init() {}
    
    public func encode<T>(_ value: T) throws -> Data where T : Encodable {
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        jsonEncoder.dateEncodingStrategy = .secondsSince1970
        let jsonData = try jsonEncoder.encode(value)
        
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])

        let str = urlEncode(jsonObject)

        print(str)
        
        let data = Data(bytes: [UInt8](str.stringByEncodingURL.utf8))
        
        print("\n")
        print(String(data: data, encoding: .utf8)!)
        
        return data
        
    }
    
    private func urlEncode(_ object: Any, for key: String? = nil) -> String {
        
        var urlEncodedString = [String]()
        
        if let dic = object as? [String : Any] {
            urlEncodedString.append(contentsOf: dic.map({ (dicKey, dicValue) -> String in
                let newKey : String = {
                    if let key = key {
                        return "\(key)[\(dicKey)]"
                    } else {
                        return "\(dicKey)"
                    }
                }()
                
                return urlEncode(dicValue, for: newKey)
            }))
        } else if let array = object as? [Any] {
            urlEncodedString.append(contentsOf: array.enumerated().map({ index, element -> String in
                
                let newKey : String = {
                    if let key = key {
                        return "\(key)[\(index)]"
                    } else {
                        return "\(index)"
                    }
                }()
                
                return urlEncode(element, for: newKey)
            }))
        } else if let string = object as? CustomStringConvertible, let key = key {
            urlEncodedString.append("\(key)=\(string.description)")
            
        }
        
        return urlEncodedString.joined(separator: "&")
    }
    
}

extension String {
    
    public var stringByEncodingURL: String {
        var ret = ""
        var g = utf8.makeIterator()
        while let c = g.next() {
            if c.shouldURLEncode {
                ret.append(String(Character(UnicodeScalar(37))))
                ret.append(c.hexString)
            } else {
                ret.append(String(Character(UnicodeScalar(c))))
            }
        }
        return ret
    }
    
}

extension UInt8 {
    var shouldURLEncode: Bool {
        let cc = self
        return ( ( cc >= 128 )
            || ( cc < 33 )
            || ( cc >= 34  && cc < 38 )
            || ( ( cc > 59  && cc < 61) || cc == 62 || cc == 58)
            || ( ( cc >= 91  && cc < 95 ) || cc == 96 )
            || ( cc >= 123 && cc <= 126 )
            || self == 43 )
    }
    
    // same as String(self, radix: 16)
    // but outputs two characters. i.e. 0 padded
    var hexString: String {
        var s = ""
        let b = self >> 4
        s.append(String(Character(UnicodeScalar(b > 9 ? b - 10 + 65 : b + 48))))
        let b2 = self & 0x0F
        s.append(String(Character(UnicodeScalar(b2 > 9 ? b2 - 10 + 65 : b2 + 48))))
        return s
    }
}
