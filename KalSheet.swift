//
//  KalSheet.swift
//  rating10
//
//  Created by Alexey Primechaev on 3/12/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct KalSheet: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var selectedBundle: Bundle
    
    var dismiss: () -> ()
    
    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 0) {
            HeaderBar(leadingAction: {self.dismiss()}, leadingTitle: "Dismiss", leadingIcon: "xmark", trailingAction: {})
            VStack(alignment: .leading, spacing: 0) {
                Group {
                    Text("Congrats!").padding(7)
                    Text("You have unlocked").padding(.horizontal, 7)
                }.font(.system(size: 27, weight: .semibold, design: .default))
                Spacer().frame(height: 14)
            RegularButton(title: selectedBundle.displayName, icon: (UserDefaults.standard.bool(forKey: selectedBundle.productID)) ? "lock.open" : "lock.fill" , subtitle: (UserDefaults.standard.bool(forKey: selectedBundle.productID)) ? "Purchased" : "Purchase", isActive: (UserDefaults.standard.bool(forKey: selectedBundle.productID)),
                          action: {})
                ForEach(selectedBundle.themes, id: \.self) { theme in
                    ThemeView(imageName: "", title: theme.displayName, theme: theme, productID: self.selectedBundle.productID, action: {
                            self.settings.selectedTheme = theme.codeName
                            let defaults = UserDefaults.standard
                            defaults.set(theme.codeName, forKey: "selectedTheme")
                        self.dismiss()
                        
                        
                        
                    })
                    
            }
        }.padding(.leading, 21).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
    }
}
