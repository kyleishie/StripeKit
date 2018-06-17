//
//  main.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation
import StripeKit

Stripe.apiKey = "sk_test_4FcuvsWpItBB4OtGL447ZxUw"

do {
//    let customerList = try Stripe.default.retrieve(CustomerList.self)
//    print(customerList!.customers!)
//
//    var customer = try Stripe.default.retrieve(Customer.self, id: "cus_CvGTY2RKLOWnff")!
//    print(customer)
//
//    let couponToCreate = Coupon<[String : String]>(duration: .once, id: "Test6", name: "Test Once Coupon", percentOff: 50)
//    let coupon = try Stripe.default.create(couponToCreate)
//
//
//    customer = try customer.update(coupon: coupon?.id)!
//    print(customer)
    
    
//    try Customer.list()?.forEach({
//        print($0.id)
//    })
//
//
//    if let customer = try Customer.findOne(email: "kyle@kyleishie.com") {
//        print("Found " + customer.id)
//
//        let confirmation = try customer.delete()!
//        print("Deleted " + confirmation.id)
//
//    }
//
//    let customer = try Customer.create(email: "kyle@kyleishie.com")!
//    print("Created " + customer.id)

    
//    let balance = try Balance.retrieve()!
//    print(balance)

    
//    let history = try Balance.Transaction.list()
//    print(history)
    
//    let subscriptions = try Subscription.list()!
//    print(subscriptions)
    
//    let newProduct = try Product.create(name: "DemoProduct", type: Product.ProductType.service)!
//    print(newProduct.name)
//
//    let product = try Product.retrieve(newProduct.id)
    
//    if let products = try Product.list() {
//        try products.forEach({ product in
//            if let confirmation = try product.delete() {
//                print("Deleted Product " + confirmation.id)
//            }
//        })
//    }
    
    let customer = try Stripe.default.retrieve(Customer.self, id: "cus_D3v55bdTB5qOIj")!
//    let source = try customer.attachSource("tok_1Ce2oTIDa5BWFSGsS8Lje9XW")
    
    

    if let newProduct = try Product.create(name: "SpecialService", type: .service) {
        if let newPlan = try Plan.create(amount: 2499, currency: .usd, interval: Plan.BillingInterval.month, productId: newProduct.id) {
            let items = [
                SubscriptionItemCreationContext(plan: newPlan.id)
            ]
            let subscription = try Subscription.create(customer: customer.id,
                                                       items: items,
                                                       source: "tok_1Ce36vIDa5BWFSGsOGcIgezC")
            
            print(subscription)
        }
    }
    

    
    
} catch {
    print(error)
}
