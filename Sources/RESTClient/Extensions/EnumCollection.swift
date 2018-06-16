//
//  EnumCollection.swift
//
//  Created by Kyle Ishie on 1/8/17.
//

import Foundation

protocol EnumCollection : Hashable {}

extension EnumCollection {
    
    static func cases() -> AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
    
    
}

extension EnumCollection {
    
    static var all: [Self] {
        var cases = [Self]()
        for caseName in self.cases() {
            cases.append(caseName)
        }
        return cases
    }
    
    
}

