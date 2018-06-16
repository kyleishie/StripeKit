//
//  Identifiable+Retrieve.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension Resource where Self : Identifiable & Retrievable & Decodable {
    
    public static func retrieve(_ id: String) throws -> Self? {
        return try Stripe.default.retrieve(Self.self, id: id)
    }
    
}

extension Resource where Self : Retrievable & Decodable {
    
    public static func retrieve() throws -> Self? {
        return try Stripe.default.retrieve(Self.self)
    }
    
}

extension Resource where Self : Listable & Decodable {
    
    public static func list() throws -> [Self]? {
        return try Stripe.default.retrieve(List<Self>.self)?.data
    }
    
}

extension Resource where Self : Identifiable & Deleteable {
    
    public func delete() throws -> DeleteConfirmation? {
        return try Stripe.default.delete(Self.self, id: self.id, responseType: DeleteConfirmation.self)
    }
    
}

extension Resource where Self : Identifiable & Updatable & Decodable {
    
    public func update<C : _EditingContext & Resource & Encodable>(_ context: C) throws -> Self? where C.Root == Self {
        return try Stripe.default.update(context, id: self.id)
    }
    
}

extension Resource where Self : Creatable & Decodable {
    
    public func create<C : _CreationContext & Resource & Encodable>(_ context: C) throws -> Self? where C.Root == Self {
        return try Stripe.default.create(context)
    }
    
}
