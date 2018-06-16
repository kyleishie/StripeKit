//
//  Mandate.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public struct Mandate : Codable {
    public enum NotificationMethod : String, Codable {
        case email
        case manual
        case none
    }
    public var notificationMethod : NotificationMethod? = nil
    
    public struct Acceptance : Codable {
        public let date : Date
        public let ip : String
        
        public enum Status : String, Codable {
            case accepted
            case refused
        }
        public let status : Status
        public let userAgent : String
    }
    
    public var acceptance : Acceptance? = nil
}
