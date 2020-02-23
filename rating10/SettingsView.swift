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

struct SettingsView: View {
    
     @EnvironmentObject var settings: UserSettings
     @ObservedObject var productsStore : ProductsStore
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                ForEach (productsStore.products, id: \.self) { prod in
                    Text(prod.subscriptionStatus()).lineLimit(nil).frame(height: 80)
                }
                
                Text("Get Premium Membership").font(.title)
                Text("Choose one of the packages above").font(.subheadline)

                self.purchaseButtons()
                self.aboutText()
                self.helperButtons()
//                self.termsText().frame(width: UIScreen.main.bounds.size.width)
//                self.dismissButton()
                
                
                Text("current theme: " + themes[self.settings.selectedTheme])
                Button(action: {
                    if(self.settings.selectedTheme == themes.count-1) {
                        self.settings.selectedTheme = 0
                    } else {
                       self.settings.selectedTheme += 1
                    }
                    
                           }) {
                               Text("change")
                           }
                
                Spacer().frame(width: 10.0, height: 50.0, alignment: .leading)
                
                Button(action: {
                    print("ha")
                    
                    
                           }) {
                               Text("iap test")
                           }
                
        }
            
    }
        
}
    
    func purchaseButtons() -> some View {
           // remake to ScrollView if has more than 2 products because they won't fit on screen.
           HStack {
               Spacer()
               ForEach(ProductsStore.shared.products, id: \.self) { prod in
                
                   PurchaseButton(block: {
                       self.purchaseProduct(skproduct: prod)
                   }, product: prod).disabled(IAPManager.shared.isActive(product: prod))
               }
               Spacer()
           }
       }
       
       func helperButtons() -> some View{
           HStack {
               Button(action: {
                   self.termsTapped()
               }) {
                   Text("Terms of use").font(.footnote)
               }
               Button(action: {
                   self.restorePurchases()
               }) {
                   Text("Restore purchases").font(.footnote)
               }
               Button(action: {
                   self.privacyTapped()
               }) {
                   Text("Privacy policy").font(.footnote)
               }
               }.padding()
       }
       
       func aboutText() -> some View {
           Text("""
                   • Unlimited searches
                   • 100GB downloads
                   • Multiplatform service
                   """).font(.subheadline).lineLimit(nil)
       }
       
       func termsText() -> some View{
           // Set height to 600 because SwiftUI has bug that multiline text is getting cut even if linelimit is nil.
           VStack {
               Text("hello world").font(.footnote).lineLimit(nil).padding()
               Spacer()
               }.frame(height: 350)
       }
       
       func dismissButton() -> some View {
           Button(action: {
             //  self.dismiss()
           }) {
               Text("Not now").font(.footnote)
               }.padding()
       }
       
       //MARK:- Actions
       
       func restorePurchases(){
           
           IAPManager.shared.restorePurchases(success: {
              // self.isDisabled = false
               ProductsStore.shared.handleUpdateStore()
            //   self.dismiss()
               
           }) { (error) in
           //    self.isDisabled = false
               ProductsStore.shared.handleUpdateStore()
               
           }
       }
       
       func termsTapped(){
           
       }
       
       func privacyTapped(){
           
       }
       
       func purchaseProduct(skproduct : SKProduct){
           print("did tap purchase product: \(skproduct.productIdentifier)")
         //  isDisabled = true
           IAPManager.shared.purchaseProduct(product: skproduct, success: {
               //self.isDisabled = false
               ProductsStore.shared.handleUpdateStore()
             //  self.dismiss()
           }) { (error) in
            //   self.isDisabled = false
               ProductsStore.shared.handleUpdateStore()
           }
       }
    
}
