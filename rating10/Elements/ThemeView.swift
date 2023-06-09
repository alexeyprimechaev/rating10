//
//  ThemeView.swift
//  rating10
//
//  Created by Alexey Primechaev on 3/4/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct ThemeView: View {
    
    @EnvironmentObject var settings: UserSettings
        
    @State var imageName = String()
    @State var title = String()
    
    @State var theme: Theme
    
    @State var productID = String()
    
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack(spacing: 14) {
                 ZStack(alignment: .center) {
                    Circle().frame(width: 38, height: 38).foregroundColor(Color(theme.codeName+"OutlineCardTextColor"))
                    Circle().frame(width: 30, height: 30).foregroundColor(Color(theme.codeName+"BackgroundColor"))
                    Circle().frame(width: 22, height: 22).foregroundColor(Color(theme.codeName+"FillCardColor"))
                    Circle().frame(width: 14, height: 14).foregroundColor(Color(theme.codeName+"TitleColor"))
                    if settings.selectedTheme == theme.codeName {
                        Circle().frame(width: 8, height: 8).offset(x: -30)
                    }

                               }
                Text(title).smallTitleStyle().opacity(UserDefaults.standard.bool(forKey: productID) ? 1: 0.5).foregroundColor(Color(theme.codeName+"OutlineCardTextColor"))
            }
        }.padding(7).buttonStyle(DeepButtonStyle()).disabled(!UserDefaults.standard.bool(forKey: productID))
    }
}

