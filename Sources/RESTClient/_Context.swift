//
//  _Context.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public protocol _Context {
    
    associatedtype Root
    
}

extension Resource where Self : _Context, Self.Root : Resource {
    
    public static var path : String {
        return Root.path
    }
    
}
