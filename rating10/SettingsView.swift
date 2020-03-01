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
                


//
//
//                Button(action: {
//                 purchaseProduct("CapitanUSATheme")
//                }) {
//                    Text("purchase CapitanUSATheme")
//                }
//
//
//                Button(action: {
//                  restorePurchases()
//
//                }) {
//                    Text("restore purchases")
//                }
                
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
                                 //   self.settings.selectedTheme = theme.codeName
                                    
                                }) {
                                    Text("hey")
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
                
               
                
                
//                Text("current theme: " + themes[self.settings.selectedTheme])
//                Button(action: {
//                    if(self.settings.selectedTheme == themes.count-1) {
//                        self.settings.selectedTheme = 0
//                    } else {
//                       self.settings.selectedTheme += 1
//                    }
//
//                           }) {
//                               Text("change")
//                           }
//
//                Spacer().frame(width: 10.0, height: 50.0, alignment: .leading)
                
             
                
        }
            
    }
        
}
    
    
    
}
