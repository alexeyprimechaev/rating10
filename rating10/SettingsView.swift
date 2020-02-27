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

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                
                Button(action: {
                 productInfo("CapitanUSATheme")
                }) {
                    Text("print CapitanUSATheme data")
                }
                
                
                Button(action: {
                 purchaseProduct("CapitanUSATheme")
                }) {
                    Text("purchase CapitanUSATheme")
                }
                
                
                Button(action: {
                  restorePurchases()
                 
                }) {
                    Text("restore purchases")
                }
                
                
                
                
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
                
             
                
        }
            
    }
        
}
    
    
    
}
