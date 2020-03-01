//
//  Theme.swift
//  rating10
//
//  Created by hex dyachuk on 27.02.2020.
//  Copyright © 2020 Alexey Primechaev. All rights reserved.
//

import Foundation



let bundles = [
    Bundle(themes: [Theme(codeName: "capitanUSA", displayName: "Capitan USA")
        ], productID: "com.monochromedev.rating10.WonderPersonsThemeBundle", displayName: "Wonder Persons Theme Bundle"
    ),
    Bundle(themes: [Theme(codeName: "angryClown", displayName: "Angry Clown"),
        Theme(codeName: "", displayName: "")
        ], productID: "com.monochromedev.rating10.DarkPersonsThemeBundle", displayName: "Dark Persons Theme Bundle"
    )
    
]

struct Bundle: Hashable{
    static func == (lhs: Bundle, rhs: Bundle) -> Bool {
        lhs.productID == rhs.productID
    }
    
    let themes: [Theme]
    let productID: String
    let displayName: String
}

struct Theme: Hashable {
    static func == (lhs: Theme, rhs: Theme) -> Bool {
        return lhs.codeName == rhs.codeName
    }
    
    let codeName:String
    let displayName: String
}
