//
//  StripeError.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

public enum StripeErrorType : String, Decodable {
    case apiConnectionError = "api_connection_error"
    case apiError = "api_error"
    case authenicationError = "authentication_error"
    case cardError = "card_error"
    case idempotencyError = "idempotency_error"
    case invalidRequestError = "invalid_request_error"
    case rateLimitError = "rate_limit_error"
    case validationError = "validation_error"
}

public struct StripeError : Error, Decodable {
    
    public let type: StripeErrorType
    
//    public let charge : Charge?
    public let code : String?
    public let declineCode : String?
    public let docURL : URL?
    public let message : String?
    public let param : String?
    
    
    enum CodingKeys : String, CodingKey {
        case error
        case type
        case code
        case declineCode
        case docURL
        case message
        case param
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let error = try container.decode(_StripeError.self, forKey: .error)
        self.init(error)
    }
    
    private init(_ internalError: _StripeError) {
        self.type = internalError.type
        self.code = internalError.code
        self.declineCode = internalError.declineCode
        self.docURL = internalError.docURL
        self.message = internalError.message
        self.param = internalError.param
    }
    
    public var localizedDescription: String {
        return """
            type: \(type)
            code: \(code ?? "Not Provided"),
            declineCode: \(declineCode ?? "Not Provided"),
            docURL: \(docURL?.absoluteString ?? "https://stripe.com/docs/api"),
            message: \(message ?? "No Message from Stripe"),
            param: \(param ?? "No parameter indication")
        """        
    }
    
}

extension StripeError : CustomStringConvertible {
    
    public var description: String {
        return localizedDescription
    }
    
}

fileprivate struct _StripeError : Error, Decodable {
    
    public let type: StripeErrorType
    
    //    public let charge : Charge?
    public let code : String?
    public let declineCode : String?
    public let docURL : URL?
    public let message : String?
    public let param : String?
    
}


/*
public enum StripeError : Error, Decodable {
    
    case apiConnectionError(code: String?)
    case apiError(code: String?)
    case authenicationError(code: String?)
    case cardError(code: String?)
    case idempotencyError(code: String?)
    case invalidRequestError(code: String?)
    case rateLimitError(code: String?)
    case validationError(code: String?)
    
    
    //MARK: Decodable
    
    private enum StripeErrorType : String, Decodable {
        case apiConnectionError = "api_connection_error"
        case apiError = "api_error"
        case authenicationError = "authentication_error"
        case cardError = "card_error"
        case idempotencyError = "idempotency_error"
        case invalidRequestError = "invalid_request_error"
        case rateLimitError = "rate_limit_error"
        case validationError = "validation_error"
    }
    
    enum CodingKeys : String, CodingKey {
        case type
        case charge
        case code
        case declineCode = "declide_code"
        case docURL = "doc_url"
        case message
        case param
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(StripeErrorType.self, forKey: .type)
        let code = try? container.decode(String.self, forKey: .code)
        
        switch type {
        case .apiConnectionError:
            self = .apiConnectionError(code: code)
            
        case .apiError:
            self = .apiError(code: code)
            
        case .authenicationError:
            self = .authenicationError(code: code)
            
        case .cardError:
            self = .cardError(code: code)
            
        case .idempotencyError:
            self = .idempotencyError(code: code)
            
        case .invalidRequestError:
            self = .invalidRequestError(code: code)
            
        case .rateLimitError:
            self = .rateLimitError(code: code)
            
        case .validationError:
            self = .validationError(code: code)
        }
    }
    
    public enum StripeErrorCode : String, Decodable {
        case account_already_exists
        case account_country_invalid_address
        case account_invalid
        case account_number_invalid
        case alipay_upgrade_required
        case amount_too_large
        case amount_too_small
        case api_key_expired
        case balance_insufficient
        case bank_account_exists
        case bank_account_unusable
        case bank_account_unverified
        case bitcoin_upgrade_required
        case card_declined
        case charge_already_captured
        case charge_already_refunded
        case charge_disputed
        case charge_expired_for_capture
        case country_unsupported
        case coupon_expired
        case customer_max_subscriptions
        case email_invalid
        case expired_card
        case incorrect_address
        case incorrect_cvc
        case incorrect_number
        case incorrect_zip
        case instant_payouts_unsupported
        case invalid_card_type
        case invalid_charge_amount
        case invalid_cvc
        case invalid_expiry_month
        case invalid_expiry_year
        case invalid_number
        case invalid_source_usage
        case invoice_no_customer_line_items
        case invoice_no_subscription_line_items
        case invoice_not_editable
        case invoice_upcoming_none
        case livemode_mismatch
        case missing
        case order_creation_failed
        case order_required_settings
        case order_status_invalid
        case order_upstream_timeout
        case out_of_inventory
        case parameter_invalid_empty
        case parameter_invalid_integer
        case parameter_invalid_string_blank
        case parameter_invalid_string_empty
        case parameter_missing
        case parameter_unknown
        case payment_method_unactivated
        case payouts_not_allowed
        case platform_api_key_expired
        case postal_code_invalid
        case processing_error
        case product_inactive
        case rate_limit
        case resource_already_exists
        case resource_missing
        case routing_number_invalid
        case secret_key_required
        case sepa_unsupported_account
        case shipping_calculation_failed
        case sku_inactive
        case state_unsupported
        case tax_id_invalid
        case taxes_calculation_failed
        case testmode_charges_only
        case tls_version_unsupported
        case token_already_used
        case token_in_use
        case transfers_not_allowed
        case upstream_order_creation_failed
        case url_invalid
    }
    
    public enum CardDeclineError : String, Decodable {
        case approveWithId = "approve_with_id"
        case callIssuer = "call_issuer"
        case cardNotSupported = "card_not_supported"
        case cardVelocityExceeded = "card_velocity_exceeded"
        case currencyNotSupported = "currency_not_supported"
        case doNotHonor = "do_not_honor"
        case doNotTryAgain = "do_not_try_again"
        case duplicateTransaction = "duplicate_transaction"
        case expiredCard = "expired_card"
        case fraudulent
        case generic = "generic_decline"
        case incorrectNumber = "incorrect_number"
        case incorrectCVC = "incorrect_cvc"
        case incorrectPin = "incorrect_pin"
        case insufficientFunds = "insufficient_funds"
        case invalidAccount = "invalid_account"
        case invalidAmount = "invalid_amount"
        case invalidCVC = "invalid_cvc"
        case invalidExpiryYear = "invalid_expiry_year"
        case invalidNumber = "invalid_number"
        case issuerNotAvailable = "issuer_not_available"
        case lostCard = "lost_card"
        case newAccountInformationAvailable = "new_account_information_available"
        case noActionTaken = "no_action_taken"
        case notPermitted = "not_permitted"
        case pickupCard = "pickup_card"
        case pinTryExceeded = "pin_try_exceeded"
        case processingError = "processing_error"
        case reenterTransaction = "reenter_transaction"
        case restrictedCard = "restricted_card"
        case revocationOfAllAuthorizations = "revocation_of_all_authorizations"
        case revocationOfAuthorization = "revocation_of_authorization"
        case securityViolation = "security_violation"
        case serviceNotAllowed = "service_not_allowed"
        case stolenCard = "stolen_card"
        case stopPaymentOrder = "stop_payment_order"
        case testmodeDecline = "testmode_decline"
        case transactionNotAllowed = "transaction_not_allowed"
        case tryAgainLater = "try_again_later"
        case withdrawCountLimitExceeded = "withdrawal_count_limit_exceeded"
    }
   
}
 */

