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
    @State var icon = String()
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
                    .opacity(isActive ? 1 : 0.5)
                    .font(.system(size: 28, weight: .bold))
                    .fixedSize()
                HStack(spacing: 4) {
                    Image(systemName: icon)
                    .padding(.bottom, 2)
                    Text(subtitle).fixedSize()
                        
                }
                .padding(.bottom, 4)
                .opacity(isActive ? 0.5 : 1)
                .font(.system(size: 14, weight: .semibold))
                
                    
            }
        }
        
            
        
        .padding(7)
        .buttonStyle(DeepButtonStyle())
        
    }
}
