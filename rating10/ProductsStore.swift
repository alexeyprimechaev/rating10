//
//  ProductsStore.swift
//  rating10
//
//  Created by hex dyachuk on 23.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import StoreKit


class ProductsStore : ObservableObject {
    
    static let shared = ProductsStore()
    let subscription_1 = "Rating10Plus"
    let shared_secret = "30fad09d57f64139ad55e5096d4e5b66"
    
    @Published var products: [SKProduct] = []
    @Published var anyString = "123" // little trick to force reload ContentView from PurchaseView by just changing any Published value
    
    func handleUpdateStore(){
        anyString = UUID().uuidString
    }
    
    func initializeProducts(){
        IAPManager.shared.startWith(arrayOfIds: [subscription_1], sharedSecret: shared_secret) { products in
            self.products = products
        }
    }
}
