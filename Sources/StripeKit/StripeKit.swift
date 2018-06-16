//
//  StripeKit.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import RESTClient

public class Stripe : StripeRESTClient {
    
    public init(_ apiKey: String) {
        let stripeAPIEndpoint = URL(string: "https://api.stripe.com/v1")!
        super.init(apiKey, url: stripeAPIEndpoint)
    }
    
    public static var apiKey : String? = nil
    
    public static let `default` : Stripe = {
        guard let key = Stripe.apiKey else {
            fatalError("Stripe.apiKey must be set in order to use Stripe.default singleton instance.")
        }
        
        return Stripe(key)
    }()
    
}

public class StripeFiles : StripeRESTClient {
    
    public init(_ apiKey: String) {
        let stripeAPIEndpoint = URL(string: "https://files.stripe.com/v1")!
        super.init(apiKey, url: stripeAPIEndpoint)
    }
    
    public static var apiKey : String? = nil
    
    public static let `default` : StripeFiles = {
        guard let key = StripeFiles.apiKey else {
            fatalError("StripeFiles.apiKey must be set in order to use StripeFiles.default singleton instance.")
        }
        
        return StripeFiles(key)
    }()
    
}

public class StripeRESTClient : RESTClient<StripeError> {
    
    private let apiKey : String
    
    public init(_ apiKey: String, url: URL) {
        self.apiKey = apiKey
        
        let config = URLSessionConfiguration.stripeApi(withBearer: apiKey)
        
        super.init(url: url, sessionConfig: config)
        
        /// Setup JSON Encoder
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        jsonEncoder.dateEncodingStrategy = .secondsSince1970
        self.encoder(jsonEncoder, for: "application/json")
        
        /// Setup Form Encoder
        let formEncoder = FormURLEnoder()
        self.encoder(formEncoder, for: "application/x-www-form-urlencoded")
        
        /// Setup JSON Decoder
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        self.decoder(jsonDecoder, for: "application/json")
        
        self.appendRequestTransformer(StripeRESTClientTranformer())
    }
    
}

struct StripeRESTClientTranformer : RequestTransformer {
    
    /// Stripe uses POST for updates so lets apply a transformer.
    public func tranform(_ request: inout URLRequest) {
        
        guard let method = request.method else {
            return
        }
        
        switch method {
        case .put, .patch, .post:
            request.method = .post
            
        default:
            return
        }
        
    }
    
}
