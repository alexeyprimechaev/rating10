//
//  SettingsView.swift
//  rating10
//
//  Created by hex dyachuk on 22.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation
import SwiftUI
import StoreKit
import Combine
import SwiftyStoreKit

struct SettingsView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @Binding var selectedBundle: Bundle
    
    @Binding var showKalSheet: Bool
    
    var dismiss: () -> ()
    
    var showSelf: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderBar(
                leadingAction: {
                    self.dismiss()
                }, leadingTitle: "Dismiss", leadingIcon: "xmark",
                trailingAction: {
                    self.restorePurchases()
            }, trailingTitle: "Restore", trailingIcon: "arrow.clockwise"
            )
        ScrollView {
            ForEach(bundles, id: \.self) { bundle in
                HStack() {
                VStack(alignment: .leading) {
                    RegularButton(title: bundle.displayName, icon: (UserDefaults.standard.bool(forKey: bundle.productID)) ? "lock.open" : "lock.fill" , subtitle: (UserDefaults.standard.bool(forKey: bundle.productID)) ? "Unlocked" : "Unlock", isActive: (UserDefaults.standard.bool(forKey: bundle.productID)),
                        action: {
                            
                            self.purchaseProduct(bundle: bundle)
                        
                        })
                        ForEach(bundle.themes, id: \.self) { theme in
                            ThemeView(imageName: "", title: theme.displayName, theme: theme, productID: bundle.productID, action: {
                                if UserDefaults.standard.bool(forKey: bundle.productID) {
                                    self.settings.selectedTheme = theme.codeName
                                    let defaults = UserDefaults.standard
                                    defaults.set(theme.codeName, forKey: "selectedTheme")
                                } else {
                                    self.purchaseProduct(bundle: bundle)
                                }
                                
                                
                            })
                            
                        }.onTapGesture {
                            self.purchaseProduct(bundle: bundle)
                    }

                }
                .padding(.leading, 21)
                .padding(.bottom, 14)
                    Spacer()
                }

                }
                
               
                
               
                
                
             
                
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
}
    
    func purchaseProduct(bundle: Bundle) {
        
        SwiftyStoreKit.purchaseProduct(bundle.productID, quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: bundle.productID)
                
                self.selectedBundle = bundle
                self.dismiss()
                self.showKalSheet = true
                
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
                for purchase in results.restoredPurchases {
                    let defaults = UserDefaults.standard
                    defaults.set(true, forKey: purchase.productId)
                }
            self.dismiss()
            
            
            }
            else {
                print("Nothing to Restore")
            }
        }
    }


    
    
}
