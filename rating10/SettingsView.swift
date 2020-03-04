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
                            restorePurchases()
                            }) {
                                Text("restore purchases")
                            }
            ForEach(bundles, id: \.self) { bundle in
                    VStack() {
                        Text(bundle.displayName)
                        if (UserDefaults.standard.bool(forKey: bundle.productID)) {
                            ForEach(bundle.themes, id: \.self) { theme in
                                Button(action: {
                                 self.settings.selectedTheme = theme.codeName
                                let defaults = UserDefaults.standard
                                defaults.set(theme.codeName, forKey: "selectedTheme")
                                    
                                }) {
                                    Text(theme.displayName)
                                }
                            }
                        }
                        else {
                            Button(action: {
                            purchaseProduct(bundle.productID)
                            }) {
                                Text("purchase")
                            }
                        }
                        
                        
                        

                    }
                }
                
                RegularButton(title: "Name", icon: "lock.fill", subtitle: "Purchase", isActive: false, action: {})
                
               
                
                
             
                
        }
            
    }
        
}


    
    
}
