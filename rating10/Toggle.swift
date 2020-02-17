//
//  Toggle.swift
//  rating-binary
//
//  Created by Alexey Primechaev on 12/17/19.
//  Copyright © 2019 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct Toggle: View {
    
    @Binding var isOn: Int
    
    var body: some View {
        
        return HStack {

            ZStack(alignment: .trailing) {
                
                RoundedRectangle(cornerRadius: 100, style: .continuous).frame(width: 28, height: 10).foregroundColor(Color.black)
                RoundedRectangle(cornerRadius: 100, style: .continuous).frame(width: 14, height: 6).foregroundColor(Color.white).padding(.trailing, 2)
                Circle()
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                    .frame(width: 18, height: 18)
                ).foregroundColor(Color.white)
                    .offset(x: isOn == 1 ? 0 : -8)
                    .animation(.easeOut(duration: 0.2))
                .frame(width: 20, height: 20)
                
            }
        }
        .frame(width: 52, height: 52)
        .contentShape(Rectangle())
        
        .onTapGesture {
            if self.isOn == 0 {
                self.isOn = 1
            } else {
                self.isOn = 0
            }
        }

    }
}
