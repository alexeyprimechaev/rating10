//
//  KalSheet.swift
//  rating10
//
//  Created by Alexey Primechaev on 3/12/20.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import SwiftUI

struct KalSheet: View {
    
    var selectedBundle: Bundle
    
    var body: some View {
        VStack {
        Text(selectedBundle.displayName)
            ForEach(selectedBundle.themes, id: \.self) { theme in
            Text(theme.displayName)
        }
        }
    }
}
