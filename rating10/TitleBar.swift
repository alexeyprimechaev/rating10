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
    var body: some View {
        ZStack {
            Rectangle()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 52, maxHeight: 52, alignment: .leading)
                .foregroundColor(Color(self.settings.selectedTheme+"BackgroundColor"))
         
            
            HStack {
                Spacer()
                HStack {
                    Text("Liked")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                        .opacity(0.5)
                    Text("Ratings")
                        .fontWeight(.semibold)
                    .foregroundColor(Color(self.settings.selectedTheme+"TitleColor"))
                    
                        
                }
                Spacer()
                
                
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    Image(systemName: "circle")
                        .foregroundColor(Color.black)
                }.padding(16)
            }
        }
    }
}

struct TitleBar_Previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
