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
                
            ForEach(bundles, id: \.self) { bundle in
                HStack() {
                VStack(alignment: .leading) {
                    RegularButton(title: bundle.displayName, icon: (UserDefaults.standard.bool(forKey: bundle.productID)) ? "lock.open" : "lock.fill" , subtitle: (UserDefaults.standard.bool(forKey: bundle.productID)) ? "Purchased" : "Purchase", isActive: (UserDefaults.standard.bool(forKey: bundle.productID)), action: {purchaseProduct(bundle.productID)})
                        ForEach(bundle.themes, id: \.self) { theme in
                            ThemeView(imageName: "", title: theme.displayName, theme: theme, action: {
                                self.settings.selectedTheme = theme.codeName
                                let defaults = UserDefaults.standard
                                defaults.set(theme.codeName, forKey: "selectedTheme")
                            })
                            
                    }.disabled(!UserDefaults.standard.bool(forKey: bundle.productID))


                        
                        
                        

                }
                .padding(.leading, 21)
                .padding(.bottom, 14)
                    Spacer()
                }

                }
                
               
                
               
                
                
             
                
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
}


    
    
}
