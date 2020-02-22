//
//  SettingsView.swift
//  rating10
//
//  Created by hex dyachuk on 22.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
     @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
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
        }
    }
}
}