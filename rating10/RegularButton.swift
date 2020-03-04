//
//  RegularButton.swift
//  TimerPlus
//
//  Created by Alexey Primechaev on 2/23/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct RegularButton: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State var title = String()
    @State var subtitle = String()
    @State var isActive = false
    
    var action: () -> ()
    
    var body: some View {
        Button(action:
            
        //MARK: Action
        {
            self.action()
        })
                
        
            //MARK: Layout
        {
            HStack(alignment: .bottom, spacing: 7) {
                Text(title)
                    .titleStyle()
                    .opacity(isActive ? 1 : 0.5)
                Text(subtitle)
                    .padding(.bottom, 5)
                    .smallTitleStyle()
                    
            }
        }
        
            
        
        .padding(7)
        .buttonStyle(DeepButtonStyle())
        
    }
}