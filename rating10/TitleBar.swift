//
//  TitleBar.swift
//  rating10
//
//  Created by hex dyachuk on 22.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct TitleBar: View {
    @EnvironmentObject var settings: UserSettings
    @State var showDetail = false
    var body: some View {
        ZStack {
            Rectangle()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                .foregroundColor(Color(self.settings.selectedTheme+"BackgroundColor"))
         
            
            HStack {
                Spacer()
                HStack {
                    if (self.settings.isInLikedMode) {
                        Button(action: {
                                               self.settings.isInLikedMode = true
                                           }) {
                                           Text("Liked")
                                               .fontWeight(.semibold)
                                               .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                                                }
                                           Button(action: {
                                               self.settings.isInLikedMode = false
                                           }) {
                                           Text("Ratings")
                                               .fontWeight(.semibold)
                                           .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                                            .opacity(0.5)
                                           }
                    } else {
                        Button(action: {
                                               self.settings.isInLikedMode = true
                                           }) {
                                           Text("Liked")
                                               .fontWeight(.semibold)
                                               .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                                               .opacity(0.5) }
                                           Button(action: {
                                               self.settings.isInLikedMode = false
                                           }) {
                                           Text("Ratings")
                                               .fontWeight(.semibold)
                                           .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                                           }
                    }
                   
                        
                }
                Spacer()
                
                
                Button(action: {
                    self.showDetail.toggle()
                }) {
                    ZStack(alignment: .center) {
                    Circle().frame(width: 24, height: 38).foregroundColor(Color(self.settings.selectedTheme+"OutlineCardTextColor"))
                    Circle().frame(width: 18, height: 30).foregroundColor(Color(self.settings.selectedTheme+"BackgroundColor"))
                                   Circle().frame(width: 12, height: 22).foregroundColor(Color(self.settings.selectedTheme+"FillCardColor"))
                                   Circle().frame(width: 6, height: 14).foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                               }
                    
                }.padding(16)
                .sheet(isPresented: $showDetail) {
                    SettingsView()
                    .environmentObject(self.settings)
                }
            }
        }
    }
}

struct TitleBar_Previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
