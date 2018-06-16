//
//  RESTClient.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import Dispatch

open class RESTClient<Error> where Error : Swift.Error & Decodable {
    
    open let baseURL : URL
    
    private(set) var session : URLSession
        
    public init(url: URL, sessionConfig: URLSessionConfiguration = .restJSONAPI) {
        self.baseURL = url
        self.session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }
    
    //MARK: Encoders
    private let _encodersLock = NSLock()
    private var _encoders : [String : CodableEncoder] = [
        "application/json" : JSONEncoder()
    ]
    public var encoders : [String : CodableEncoder] {
        get {
            _encodersLock.lock()
            defer { _encodersLock.unlock() }
            return _encoders
        }
        set {
            _encodersLock.lock()
            _encoders = newValue
            _encodersLock.unlock()
        }
    }
    
    public func encoder(_ encoder: CodableEncoder, for contentTypes: String...) {
        contentTypes.forEach({ [weak self] contentType in
            self?.encoders[contentType] = encoder
        })
    }
    
    public func setJSONBody<T : Encodable>(_ body: T, for request: inout URLRequest) throws {
        
        guard let contentType = request.contentType ?? session.configuration.httpAdditionalHeaders?["Content-Type"] as? ContentType else {
            fatalError("You need to set Content-Type on the URLSessionConfiguration.")
        }
        
        guard let encoder = encoders[contentType] else {
            fatalError("No encoder found for Content-Type: \(contentType).")
        }
        
        try request.setJSONBody(body, with: encoder)
    }
    
    
    //MARK: Decoders
    private let _decodersLock = NSLock()
    private var _decoders : [String : CodableDecoder] = [
        "application/json" : JSONDecoder()
    ]
    public var decoders : [String : CodableDecoder] {
        get {
            _decodersLock.lock()
            defer { _decodersLock.unlock() }
            return _decoders
        }
        set {
            _decodersLock.lock()
            _decoders = newValue
            _decodersLock.unlock()
        }
    }
    
    public func decoder(_ decoder: CodableDecoder, for contentTypes: String...) {
        contentTypes.forEach({ [weak self] contentType in
            self?.decoders[contentType] = decoder
        })
    }
    
    //MARK: Request Transformers
    
    
    
    private let _transformersLock = NSLock()
    private var _transformers = [RequestTransformer]()
    public var transformers : [RequestTransformer] {
        get {
            _transformersLock.lock()
            defer { _transformersLock.unlock() }
            return _transformers
        }
        set {
            _transformersLock.lock()
            _transformers = newValue
            _transformersLock.unlock()
        }
    }
    
    public func appendRequestTransformer(_ transformer: RequestTransformer) {
        self.transformers.append(transformer)
    }
}

public protocol RequestTransformer {
    
    func tranform(_ request: inout URLRequest)
    
}

public typealias Query = [String : String]
