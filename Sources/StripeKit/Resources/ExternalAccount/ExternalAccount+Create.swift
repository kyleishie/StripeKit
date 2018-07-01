//
//  ExternalAccount+Create.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

extension ExternalAccountCreationContext {
    
    public func create(_ accountId: String) throws -> ExternalAccount? {
        
        var request = URLRequest(Stripe.default.baseURL, pathItems: "accounts", accountId, "external_accounts")
        request.method = .post
        try Stripe.default.setJSONBody(self, for: &request)
        return try Stripe.default.performSyncDataTask(ExternalAccount.self, with: request)
        
    }
    
}
