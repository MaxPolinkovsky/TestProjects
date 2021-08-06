//
//  SKProductsRequestDelegate.swift
//  learnde
//
//  Created by Max Polinkovsky on 02.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import Foundation
import StoreKit

// MARK:- SKReceipt Refresh Request Delegate
//extension IAPManager : SKRequestDelegate {
//    
//    func requestDidFinish(_ request: SKRequest) {
//        if request is SKReceiptRefreshRequest {
//            refreshSubscriptionsStatus(callback: self.successBlock ?? {}, failure: self.failureBlock ?? {_ in})
//        }
//    }
//    
//    func request(_ request: SKRequest, didFailWithError error: Error){
//        if request is SKReceiptRefreshRequest {
//            self.refreshSubscriptionFailureBlock?(error)
//            self.cleanUpRefeshReceiptBlocks()
//        }
//        print("error: \(error.localizedDescription)")
//    }
//}
//
//// MARK:- SKProducts Request Delegate
//extension IAPManager: SKProductsRequestDelegate {
//    
//    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        products = response.products
//        makeCurrentProduct(products: products)
//        DispatchQueue.main.async {
//            NotificationCenter.default.post(name: IAP_PRODUCTS_DID_LOAD_NOTIFICATION, object: nil)
//        }
//    }
//    
//    private func makeCurrentProduct(products: [SKProduct]?) {
//        guard let products = products else { return }
//        for item in products {
//            
//            productsArray.append(Product(
//                periodText: getPeriodDescription(for: Int(item.subscriptionPeriod?.unit.rawValue ?? 100)),
//                periodValue: item.subscriptionPeriod?.numberOfUnits ?? 0,
//                priceValue: Double(truncating: item.price),
//                priceSimbol: item.priceLocale.currencySymbol ?? "",
//                productId: item.productIdentifier))
//        }
//        
//        productsArray = productsArray.sorted(by: { (product1, product2) -> Bool in
//            return product1.priceValue < product2.priceValue
//        })
//    }
//    
//    private func getPeriodDescription(for unit: Int) -> String {
//        switch unit {
//        case 0:
//            return "day"
//        case 1:
//            return "month".localized()
//        case 2:
//            return "months".localized()
//        case 3:
//            return "year".localized()
//        default:
//            return ""
//        }
//    }
//}
//
//// MARK:- SKPayment Transaction Observer
//extension IAPManager: SKPaymentTransactionObserver {
//    
//    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        
//        for transaction in transactions {
//            switch (transaction.transactionState) {
//            case .purchased:
//                SKPaymentQueue.default().finishTransaction(transaction)
//                notifyIsPurchased(transaction: transaction)
//                break
//            case .failed:
//                SKPaymentQueue.default().finishTransaction(transaction)
//                print("purchase error : \(transaction.error?.localizedDescription ?? "")")
//                self.failureBlock?(transaction.error)
//                cleanUp()
//                break
//            case .restored:
//                SKPaymentQueue.default().finishTransaction(transaction)
//                notifyIsPurchased(transaction: transaction)
//                break
//            case .deferred, .purchasing:
//                break
//            default:
//                break
//            }
//        }
//    }
//    
//    private func notifyIsPurchased(transaction: SKPaymentTransaction) {
//        refreshSubscriptionsStatus(callback: {
//            self.successBlock?()
//            self.cleanUp()
//        }) { (error) in
//            self.failureBlock?(error)
//            self.cleanUp()
//        }
//    }
//    
//    func cleanUp(){
//        self.successBlock = nil
//        self.failureBlock = nil
//    }
//}
//
//extension IAPManager {
//    func getSubscriptionStatus() -> Bool {
//        let month1 = defaults.object(forKey: Products.oneMonth.rawValue)
//        let year1 = defaults.object(forKey: Products.oneYear.rawValue)
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
//        
//        var parameter = false
//        
//        if let value = month1 as? Date {
//            if value > Date() {
//                parameter = true
//            }
//        }
//        
//        if let value = year1 as? Date {
//            if value > Date() {
//                parameter = true
//            }
//        }        
//        return parameter
//    }
//}
