//
//  PurchaseTools.swift
//  rating10
//
//  Created by hex dyachuk on 25.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation
import StoreKit
import Combine
import SwiftyStoreKit

func purchaseProduct(_ productName: String) {
    SwiftyStoreKit.purchaseProduct(productName, quantity: 1, atomically: true) { result in
        switch result {
        case .success(let purchase):
            print("Purchase Success: \(purchase.productId)")
        case .error(let error):
            switch error.code {
            case .unknown: print("Unknown error. Please contact support")
            case .clientInvalid: print("Not allowed to make the payment")
            case .paymentCancelled: break
            case .paymentInvalid: print("The purchase identifier was invalid")
            case .paymentNotAllowed: print("The device is not allowed to make the payment")
            case .storeProductNotAvailable: print("The product is not available in the current storefront")
            case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
            case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
            default: print((error as NSError).localizedDescription)
            }
        }
    }
}

func productInfo(_ productName: String) {
    SwiftyStoreKit.retrieveProductsInfo([productName]) { result in
        if let product = result.retrievedProducts.first {
            let priceString = product.localizedPrice!
            print("Product: \(product.localizedDescription), price: \(priceString)")
        }
        else if let invalidProductId = result.invalidProductIDs.first {
            print("Invalid product identifier: \(invalidProductId)")
        }
        else {
            print("Error: \(result.error)")
        }
    }
}

func restorePurchases() {
    SwiftyStoreKit.restorePurchases(atomically: true) { results in
        if results.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(results.restoreFailedPurchases)")
        }
        else if results.restoredPurchases.count > 0 {
            print("Restore Success: \(results.restoredPurchases)")
        }
        else {
            print("Nothing to Restore")
        }
    }
}


