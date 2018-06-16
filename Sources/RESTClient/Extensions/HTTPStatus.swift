//
//  HTTPStatus.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

//MARK: Status Code Definitions
public enum HTTPStatus : Int {
    
    case unknown = -1
    
    case `continue` = 100
    case switchingProtocols = 101
    
    case ok = 200
    case created = 201
    case accepted = 202
    case nonauthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case temporaryRedirect = 307
    
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllow = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case requestEntityTooLarge = 413
    case requestURITooLong = 414
    case unsupportedMediaType = 415
    case requestedRangeNotSatisfiable = 416
    case expectationFailed = 417
    
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505
    
}

extension HTTPStatus : Comparable {
    
    public static func < (lhs: HTTPStatus, rhs: HTTPStatus) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

extension HTTPStatus {
    
    static let acceptableRange = HTTPStatus.ok...HTTPStatus.partialContent
    
}

public enum HTTPURLResponseError : Error {
    case unacceptableStatus(HTTPStatus)
}

extension HTTPURLResponse {
    
    public var status : HTTPStatus {
        return HTTPStatus(rawValue: statusCode) ?? .unknown
    }

    func validate() throws {
        if (!HTTPStatus.acceptableRange.contains(status)) {
            throw HTTPURLResponseError.unacceptableStatus(status)
        }
    }
    
}
