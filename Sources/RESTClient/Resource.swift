//
//  Resource.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public protocol Resource {
        
    static var path : String { get }
    
}

public protocol Identifiable {
    
    var id : String { get }
    
}

public protocol Listable {}
public protocol Retrievable {}
public protocol Creatable {}
public protocol Replaceable {}
public protocol Updatable {}
public protocol Deleteable {}


extension Resource {
    
    /// A default implementation of path that, for example, would change "Resource" to "resources".
    public static var path : String {
        let typeString = String(describing: Self.self).lowercased()
        let typeStringPlural = typeString + "s"
        return typeStringPlural
    }
    
}
